import 'dart:async';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'payment_endpoint.dart';

/// HTTP Webhook Route for Razorpay: POST /webhook/razorpay
class RazorpayWebhookRoute extends Route {
  RazorpayWebhookRoute() : super(methods: {Method.post}, path: '/webhook/razorpay');

  @override
  FutureOr<Result> handleCall(Session session, Request request) async {
    final signature = request.headers['x-razorpay-signature']?.firstOrNull;
    if (signature == null || signature.isEmpty) {
      return Response.badRequest(
        body: Body.fromString(jsonEncode({'error': 'Missing x-razorpay-signature header'})),
      );
    }

    final payload = await request.readAsString();
    if (payload.isEmpty) {
      return Response.badRequest(
        body: Body.fromString(jsonEncode({'error': 'Empty payload'})),
      );
    }

    final endpoint = PaymentEndpoint();
    final result = await endpoint.handleWebhook(session, payload, signature);

    if (!result.success) {
      return Response.badRequest(
        body: Body.fromString(jsonEncode({'error': result.message})),
      );
    }

    return Response.ok(
      body: Body.fromString(jsonEncode({
        'status': 'ok',
        'isProcessed': result.isProcessed,
        'orderId': result.orderId,
        'paymentId': result.paymentId,
      })),
    );
  }
}
