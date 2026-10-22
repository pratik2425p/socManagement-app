import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AccountingEndpoint extends Endpoint {
  /// Get vouchers for a society with optional status filter
  Future<List<VoucherRequest>> getVouchers(
    Session session,
    int societyId, {
    VoucherStatus? status,
  }) async {
    return await VoucherRequest.db.find(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          (status != null ? t.status.equals(status) : Constant.bool(true)),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Committee member creates a voucher expense request
  Future<VoucherRequest> createVoucherRequest(
    Session session,
    VoucherRequest request,
  ) async {
    request.status = VoucherStatus.pendingApproval;
    return await VoucherRequest.db.insertRow(session, request);
  }

  /// Chairman approves voucher request
  Future<VoucherRequest?> approveVoucher(
    Session session,
    int voucherId,
    String approvedByName,
  ) async {
    final voucher = await VoucherRequest.db.findById(session, voucherId);
    if (voucher == null) return null;

    voucher.status = VoucherStatus.approved;
    voucher.approvedByName = approvedByName;
    voucher.approvedAt = DateTime.now();

    return await VoucherRequest.db.updateRow(session, voucher);
  }

  /// Chairman rejects voucher request
  Future<VoucherRequest?> rejectVoucher(
    Session session,
    int voucherId,
    String reason,
  ) async {
    final voucher = await VoucherRequest.db.findById(session, voucherId);
    if (voucher == null) return null;

    voucher.status = VoucherStatus.rejected;
    voucher.rejectionReason = reason;

    return await VoucherRequest.db.updateRow(session, voucher);
  }

  /// Accountant-only action: Post approved voucher into the double-entry financial ledger
  Future<LedgerEntry> postVoucherToLedger(
    Session session,
    int voucherId,
    String postedByName,
    String description,
    double debit,
    double credit,
  ) async {
    final voucher = await VoucherRequest.db.findById(session, voucherId);
    if (voucher != null) {
      voucher.status = VoucherStatus.postedToLedger;
      await VoucherRequest.db.updateRow(session, voucher);
    }

    final entry = LedgerEntry(
      societyId: voucher?.societyId ?? 1,
      entryNumber: 'JE-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      voucherId: voucherId,
      entryDate: DateTime.now(),
      description: description,
      postedByName: postedByName,
      totalDebit: debit,
      totalCredit: credit,
      postedAt: DateTime.now(),
    );

    return await LedgerEntry.db.insertRow(session, entry);
  }

  /// Fetch financial ledger entries
  Future<List<LedgerEntry>> getLedgerEntries(Session session, int societyId) async {
    return await LedgerEntry.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.entryDate,
      orderDescending: true,
    );
  }

  /// Fetch chart of accounts
  Future<List<LedgerAccount>> getLedgerAccounts(Session session, int societyId) async {
    return await LedgerAccount.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.accountCode,
    );
  }
}
