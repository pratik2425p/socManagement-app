import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:society_client/society_client.dart';

/// Builder for 80mm POS thermal roll receipt format
class ThermalReceiptBuilder {
  ThermalReceiptBuilder._();

  static pw.Page build({
    required MaintenanceBill bill,
    required PaymentRecord record,
    required String societyName,
    required String regNo,
    required String gstin,
    required String formattedDate,
    required String qrData,
  }) {
    return pw.Page(
      pageFormat: const PdfPageFormat(80 * PdfPageFormat.mm, 200 * PdfPageFormat.mm, marginAll: 4 * PdfPageFormat.mm),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(societyName, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold), textAlign: pw.TextAlign.center),
            pw.Text('Reg: $regNo', style: const pw.TextStyle(fontSize: 8)),
            pw.Text('GSTIN: $gstin', style: const pw.TextStyle(fontSize: 8)),
            pw.Divider(thickness: 0.8),
            pw.Text('MAINTENANCE RECEIPT', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.Text(record.receiptNumber, style: const pw.TextStyle(fontSize: 9)),
            pw.Divider(thickness: 0.5),

            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Date:', style: const pw.TextStyle(fontSize: 8)), pw.Text(formattedDate, style: const pw.TextStyle(fontSize: 8))]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Flat:', style: const pw.TextStyle(fontSize: 8)), pw.Text(bill.flatNumber, style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold))]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Payer:', style: const pw.TextStyle(fontSize: 8)), pw.Text(record.payerName, style: const pw.TextStyle(fontSize: 8))]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Txn Ref:', style: const pw.TextStyle(fontSize: 8)), pw.Text(record.transactionReference, style: const pw.TextStyle(fontSize: 7))]),
            pw.Divider(thickness: 0.5),

            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Base Maintenance', style: const pw.TextStyle(fontSize: 8)), pw.Text('1,500.00', style: const pw.TextStyle(fontSize: 8))]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Sinking Fund', style: const pw.TextStyle(fontSize: 8)), pw.Text('350.00', style: const pw.TextStyle(fontSize: 8))]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Water / Lift', style: const pw.TextStyle(fontSize: 8)), pw.Text('400.00', style: const pw.TextStyle(fontSize: 8))]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Parking / Security', style: const pw.TextStyle(fontSize: 8)), pw.Text('200.00', style: const pw.TextStyle(fontSize: 8))]),
            if (bill.lateFee > 0)
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [pw.Text('Late Fee', style: const pw.TextStyle(fontSize: 8)), pw.Text(bill.lateFee.toStringAsFixed(2), style: const pw.TextStyle(fontSize: 8))]),
            pw.Divider(thickness: 0.8),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('TOTAL PAID:', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                pw.Text('Rs. ${record.amount.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.SizedBox(height: 8),
            pw.BarcodeWidget(barcode: pw.Barcode.qrCode(), data: qrData, width: 48, height: 48),
            pw.SizedBox(height: 4),
            pw.Text('PAID & POSTED TO GENERAL LEDGER', style: pw.TextStyle(fontSize: 7, fontWeight: pw.FontWeight.bold)),
            pw.Text('Thank you for prompt payment!', style: const pw.TextStyle(fontSize: 7)),
          ],
        );
      },
    );
  }
}
