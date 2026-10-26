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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UploadDescriptionResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UploadDescriptionResponse._({
    required this.uploadDescription,
    required this.storagePath,
  });

  factory UploadDescriptionResponse({
    required String uploadDescription,
    required String storagePath,
  }) = _UploadDescriptionResponseImpl;

  factory UploadDescriptionResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UploadDescriptionResponse(
      uploadDescription: jsonSerialization['uploadDescription'] as String,
      storagePath: jsonSerialization['storagePath'] as String,
    );
  }

  String uploadDescription;

  String storagePath;

  /// Returns a shallow copy of this [UploadDescriptionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UploadDescriptionResponse copyWith({
    String? uploadDescription,
    String? storagePath,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UploadDescriptionResponse',
      'uploadDescription': uploadDescription,
      'storagePath': storagePath,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UploadDescriptionResponse',
      'uploadDescription': uploadDescription,
      'storagePath': storagePath,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UploadDescriptionResponseImpl extends UploadDescriptionResponse {
  _UploadDescriptionResponseImpl({
    required String uploadDescription,
    required String storagePath,
  }) : super._(
         uploadDescription: uploadDescription,
         storagePath: storagePath,
       );

  /// Returns a shallow copy of this [UploadDescriptionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UploadDescriptionResponse copyWith({
    String? uploadDescription,
    String? storagePath,
  }) {
    return UploadDescriptionResponse(
      uploadDescription: uploadDescription ?? this.uploadDescription,
      storagePath: storagePath ?? this.storagePath,
    );
  }
}
