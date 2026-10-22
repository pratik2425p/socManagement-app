/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum UserRole implements _i1.SerializableModel {
  resident,
  guard,
  committee,
  chairman,
  accountant,
  admin;

  static UserRole fromJson(String name) {
    switch (name) {
      case 'resident':
        return UserRole.resident;
      case 'guard':
        return UserRole.guard;
      case 'committee':
        return UserRole.committee;
      case 'chairman':
        return UserRole.chairman;
      case 'accountant':
        return UserRole.accountant;
      case 'admin':
        return UserRole.admin;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "UserRole"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
