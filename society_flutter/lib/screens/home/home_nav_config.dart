import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';

/// Navigation items and role display helpers for HomeScreen shell
class HomeNavConfig {
  static String getRoleLabel(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return 'Resident';
      case UserRole.guard:
        return 'Security Guard';
      case UserRole.chairman:
        return 'Society Admin';
      case UserRole.committee:
        return 'Committee';
      case UserRole.accountant:
        return 'Accountant';
      case UserRole.admin:
        return 'SaaS Admin';
    }
  }

  static List<BottomNavigationBarItem> getNavItemsForRole(UserRole role) {
    switch (role) {
      case UserRole.resident:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined), label: 'Vault'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote_outlined), label: 'Polling'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_tennis_rounded), label: 'Amenities'),
        ];

      case UserRole.chairman:
      case UserRole.committee:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_suggest_rounded), label: 'Setup'),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_outlined), label: 'Vault'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote_outlined), label: 'Polling'),
          BottomNavigationBarItem(icon: Icon(Icons.security_update_good_rounded), label: 'Audit'),
        ];

      case UserRole.guard:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.security_rounded), label: 'Gate Console'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded), label: 'Pass Scanner'),
          BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'Daily Log'),
        ];

      case UserRole.accountant:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_rounded), label: 'Accounting'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_rounded), label: 'Bills & Dues'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Ledger'),
        ];

      case UserRole.admin:
        return const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_rounded), label: 'SaaS Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.business_center_rounded), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.add_business_rounded), label: 'Onboard Society'),
        ];
    }
  }
}
