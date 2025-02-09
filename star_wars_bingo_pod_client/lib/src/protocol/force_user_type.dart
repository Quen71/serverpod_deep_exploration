/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum ForceUserType implements _i1.SerializableModel {
  sithMaster,
  sithApprentice,
  jediMaster,
  jediApprentice;

  static ForceUserType fromJson(String name) {
    switch (name) {
      case 'sithMaster':
        return sithMaster;
      case 'sithApprentice':
        return sithApprentice;
      case 'jediMaster':
        return jediMaster;
      case 'jediApprentice':
        return jediApprentice;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ForceUserType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
