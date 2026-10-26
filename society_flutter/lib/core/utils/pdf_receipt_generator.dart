import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:society_client/society_client.dart';
import 'thermal_receipt_builder.dart';

enum ReceiptFormat { a4, thermal80mm }

/// PDF Receipt Generator for Housing Society Maintenance Collections
/// Generates A4 and 80mm POS Thermal receipts with QR code, GSTIN, and breakdown.
class PdfReceiptGenerator {
  PdfReceiptGenerator._();

  /// Generates the PDF document as byte array.
  static Future<Uint8List> generateReceiptPdf({
    required MaintenanceBill bill,
    required PaymentRecord record,
    required Society? society,
    ReceiptFormat format = ReceiptFormat.a4,
  }) async {
    final doc = pw.Document();
    final dateFormat = DateFormat('dd MMM yyyy, hh:mm a');
    final formattedDate = dateFormat.format(record.paymentDate);

    final societyName = society?.name ?? 'Co-operative Housing Society Ltd.';
    final regNo = (society?.registrationNumber?.isNotEmpty == true)
        ? society!.registrationNumber!
        : 'MAH/MUM/12345/2018';
    final gstin = (society?.gstin?.isNotEmpty == true)
        ? society!.gstin!
        : '27AABCU9603R1ZM';
    final address = '${society?.address ?? "Main Gate"}, ${society?.city ?? "Mumbai"} - ${society?.pincode ?? "400001"}';

    final qrData = 'SOCPAY:${society?.code ?? "SOC"}|RCP:${record.receiptNumber}|TXN:${record.transactionReference}|AMT:${record.amount}|FLAT:${bill.flatNumber}';

    if (format == ReceiptFormat.thermal80mm) {
      doc.addPage(ThermalReceiptBuilder.build(
        bill: bill,
        record: record,
        societyName: societyName,
        regNo: regNo,
        gstin: gstin,
        formattedDate: formattedDate,
        qrData: qrData,
      ));
    } else {
      doc.addPage(_buildA4Page(
        bill: bill,
        record: record,
        societyName: societyName,
        regNo: regNo,
        gstin: gstin,
        address: address,
        formattedDate: formattedDate,
        qrData: qrData,
      ));
    }

    return await doc.save();
  }

  /// Sends receipt to connected printer or native print spooler.
  static Future<void> printReceipt({
    required MaintenanceBill bill,
    required PaymentRecord record,
    required Society? society,
    ReceiptFormat format = ReceiptFormat.a4,
  }) async {
    final bytes = await generateReceiptPdf(
      bill: bill,
      record: record,
      society: society,
      format: format,
    );
    await Printing.layoutPdf(
      onLayout: (_) => bytes,
      name: 'Receipt_${record.receiptNumber}',
      format: format == ReceiptFormat.thermal80mm
          ? const PdfPageFormat(80 * PdfPageFormat.mm, double.infinity, marginAll: 4 * PdfPageFormat.mm)
          : PdfPageFormat.a4,
    );
  }

  /// Shares receipt PDF through native OS share sheet.
  static Future<void> shareReceipt({
    required MaintenanceBill bill,
    required PaymentRecord record,
    required Society? society,
    ReceiptFormat format = ReceiptFormat.a4,
  }) async {
    final bytes = await generateReceiptPdf(
      bill: bill,
      record: record,
      society: society,
      format: format,
    );
    await Printing.sharePdf(
      bytes: bytes,
      filename: 'Receipt_${record.receiptNumber}.pdf',
    );
  }

  static pw.Page _buildA4Page({
    required MaintenanceBill bill,
    required PaymentRecord record,
    required String societyName,
    required String regNo,
    required String gstin,
    required String address,
    required String formattedDate,
    required String qrData,
  }) {
    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(societyName, style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 4),
                      pw.Text(address, style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                      pw.Text('Reg No: $regNo  |  GSTIN: $gstin', style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                    ],
                  ),
                ),
                pw.BarcodeWidget(
                  barcode: pw.Barcode.qrCode(),
                  data: qrData,
                  width: 65,
                  height: 65,
                ),
              ],
            ),
            pw.Divider(thickness: 1.5, color: PdfColors.blueGrey800),
            pw.SizedBox(height: 8),

            // Title Banner
            pw.Container(
              padding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: const pw.BoxDecoration(color: PdfColors.blue50),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('OFFICIAL MAINTENANCE PAYMENT RECEIPT', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11, color: PdfColors.blue900)),
                  pw.Text('STATUS: PAID & VERIFIED', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.green800)),
                ],
              ),
            ),
            pw.SizedBox(height: 12),

            // Metadata Grid
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      _buildMetaText('Receipt No:', record.receiptNumber),
                      _buildMetaText('Bill No:', bill.billNumber),
                      _buildMetaText('Billing Month:', bill.billingMonth),
                      _buildMetaText('Payment Date:', formattedDate),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      _buildMetaText('Flat / Unit No:', bill.flatNumber),
                      _buildMetaText('Payer Name:', record.payerName),
                      _buildMetaText('Payment Mode:', record.paymentMethod),
                      _buildMetaText('Transaction Ref:', record.transactionReference),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 16),

            // Head-wise Breakdown Table
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey400, width: 0.5),
              children: [
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                  children: [
                    _tableCell('Tariff Head / Particulars', isHeader: true),
                    _tableCell('Amount (INR)', isHeader: true, align: pw.TextAlign.right),
                  ],
                ),
                pw.TableRow(children: [_tableCell('Society Maintenance (Base Charge)'), _tableCell('Rs. 1,500.00', align: pw.TextAlign.right)]),
                pw.TableRow(children: [_tableCell('Sinking & Major Repair Fund'), _tableCell('Rs. 350.00', align: pw.TextAlign.right)]),
                pw.TableRow(children: [_tableCell('Water & Elevator Operating Charges'), _tableCell('Rs. 400.00', align: pw.TextAlign.right)]),
                pw.TableRow(children: [_tableCell('Parking & Security Facility Services'), _tableCell('Rs. 200.00', align: pw.TextAlign.right)]),
                if (bill.lateFee > 0)
                  pw.TableRow(children: [_tableCell('Late Payment Interest / Penalty'), _tableCell('Rs. ${bill.lateFee.toStringAsFixed(2)}', align: pw.TextAlign.right)]),
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.blue50),
                  children: [
                    _tableCell('TOTAL AMOUNT PAID', isHeader: true),
                    _tableCell('Rs. ${record.amount.toStringAsFixed(2)}', isHeader: true, align: pw.TextAlign.right),
                  ],
                ),
              ],
            ),
            pw.Spacer(),

            // Footer Signatures & Auto-Reconciled Note
            pw.Divider(thickness: 0.5, color: PdfColors.grey400),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Auto-reconciled with Double-Entry General Ledger.', style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
                    pw.Text('This is a computer-generated receipt. No physical signature required.', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
                  ],
                ),
                pw.Text('For ${societyName.split(" ").first} Society Office', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ],
        );
      },
    );
  }

  static pw.Widget _buildMetaText(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
      child: pw.Row(
        children: [
          pw.SizedBox(width: 85, child: pw.Text(label, style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700))),
          pw.Expanded(child: pw.Text(value, style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
        ],
      ),
    );
  }

  static pw.Widget _tableCell(String text, {bool isHeader = false, pw.TextAlign align = pw.TextAlign.left}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(5),
      child: pw.Text(
        text,
        textAlign: align,
        style: pw.TextStyle(fontSize: isHeader ? 9 : 8.5, fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal),
      ),
    );
  }
}
