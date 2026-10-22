import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SaasAdminEndpoint extends Endpoint {
  /// Fetch high-level SaaS platform metrics
  Future<SaasMetricSummary> getMetricSummary(Session session) async {
    final subscriptions = await SocietySubscription.db.find(session);

    int totalSocieties = subscriptions.length;
    int activeCount = subscriptions.where((s) => s.status == 'active').length;
    int trialCount = subscriptions.where((s) => s.status == 'trial').length;
    int totalFlats = 0;
    double mrr = 0.0;

    for (final sub in subscriptions) {
      totalFlats += sub.flatCount;
      if (sub.status == 'active') {
        mrr += sub.monthlyTotal;
      }
    }

    return SaasMetricSummary(
      totalSocieties: totalSocieties,
      activeSubscriptions: activeCount,
      trialSocieties: trialCount,
      totalManagedFlats: totalFlats,
      monthlyRecurringRevenue: mrr,
      averageRevenuePerSociety: totalSocieties > 0 ? mrr / totalSocieties : 0.0,
    );
  }

  /// List all client society subscriptions
  Future<List<SocietySubscription>> getAllSubscriptions(Session session) async {
    return await SocietySubscription.db.find(
      session,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Register new society subscription
  Future<SocietySubscription> createSubscription(
    Session session,
    SocietySubscription sub,
  ) async {
    return await SocietySubscription.db.insertRow(session, sub);
  }

  /// Update subscription status (active, past_due, suspended)
  Future<SocietySubscription?> updateSubscriptionStatus(
    Session session,
    int subscriptionId,
    String status,
  ) async {
    final sub = await SocietySubscription.db.findById(session, subscriptionId);
    if (sub == null) return null;

    sub.status = status;
    return await SocietySubscription.db.updateRow(session, sub);
  }
}
