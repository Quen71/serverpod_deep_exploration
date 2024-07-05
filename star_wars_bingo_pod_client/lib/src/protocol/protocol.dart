/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'bounty_hunter.dart' as _i2;
import 'bounty_hunter_raw.dart' as _i3;
import 'droid.dart' as _i4;
import 'force_user.dart' as _i5;
import 'force_user_raw.dart' as _i6;
import 'force_user_type.dart' as _i7;
import 'hunter_hunted.dart' as _i8;
import 'laser_saber.dart' as _i9;
import 'protocol.dart' as _i10;
import 'package:star_wars_bingo_pod_client/src/protocol/force_user.dart'
    as _i11;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i12;
export 'bounty_hunter.dart';
export 'bounty_hunter_raw.dart';
export 'droid.dart';
export 'force_user.dart';
export 'force_user_raw.dart';
export 'force_user_type.dart';
export 'hunter_hunted.dart';
export 'laser_saber.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.BountyHunter) {
      return _i2.BountyHunter.fromJson(data) as T;
    }
    if (t == _i3.BountyHunterRaw) {
      return _i3.BountyHunterRaw.fromJson(data) as T;
    }
    if (t == _i4.Droid) {
      return _i4.Droid.fromJson(data) as T;
    }
    if (t == _i5.ForceUser) {
      return _i5.ForceUser.fromJson(data) as T;
    }
    if (t == _i6.ForceUserRaw) {
      return _i6.ForceUserRaw.fromJson(data) as T;
    }
    if (t == _i7.ForceUserType) {
      return _i7.ForceUserType.fromJson(data) as T;
    }
    if (t == _i8.HunterHunted) {
      return _i8.HunterHunted.fromJson(data) as T;
    }
    if (t == _i9.LaserSaber) {
      return _i9.LaserSaber.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.BountyHunter?>()) {
      return (data != null ? _i2.BountyHunter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.BountyHunterRaw?>()) {
      return (data != null ? _i3.BountyHunterRaw.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Droid?>()) {
      return (data != null ? _i4.Droid.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ForceUser?>()) {
      return (data != null ? _i5.ForceUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ForceUserRaw?>()) {
      return (data != null ? _i6.ForceUserRaw.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ForceUserType?>()) {
      return (data != null ? _i7.ForceUserType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.HunterHunted?>()) {
      return (data != null ? _i8.HunterHunted.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.LaserSaber?>()) {
      return (data != null ? _i9.LaserSaber.fromJson(data) : null) as T;
    }
    if (t == List<_i10.ForceUser>) {
      return (data as List).map((e) => deserialize<_i10.ForceUser>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i10.HunterHunted>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.HunterHunted>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i10.Droid>) {
      return (data as List).map((e) => deserialize<_i10.Droid>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i10.ForceUserRaw>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.ForceUserRaw>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.Droid>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.Droid>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.HunterHunted>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.HunterHunted>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i11.ForceUser>) {
      return (data as List).map((e) => deserialize<_i11.ForceUser>(e)).toList()
          as dynamic;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.BountyHunter) {
      return 'BountyHunter';
    }
    if (data is _i3.BountyHunterRaw) {
      return 'BountyHunterRaw';
    }
    if (data is _i4.Droid) {
      return 'Droid';
    }
    if (data is _i5.ForceUser) {
      return 'ForceUser';
    }
    if (data is _i6.ForceUserRaw) {
      return 'ForceUserRaw';
    }
    if (data is _i7.ForceUserType) {
      return 'ForceUserType';
    }
    if (data is _i8.HunterHunted) {
      return 'HunterHunted';
    }
    if (data is _i9.LaserSaber) {
      return 'LaserSaber';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'BountyHunter') {
      return deserialize<_i2.BountyHunter>(data['data']);
    }
    if (data['className'] == 'BountyHunterRaw') {
      return deserialize<_i3.BountyHunterRaw>(data['data']);
    }
    if (data['className'] == 'Droid') {
      return deserialize<_i4.Droid>(data['data']);
    }
    if (data['className'] == 'ForceUser') {
      return deserialize<_i5.ForceUser>(data['data']);
    }
    if (data['className'] == 'ForceUserRaw') {
      return deserialize<_i6.ForceUserRaw>(data['data']);
    }
    if (data['className'] == 'ForceUserType') {
      return deserialize<_i7.ForceUserType>(data['data']);
    }
    if (data['className'] == 'HunterHunted') {
      return deserialize<_i8.HunterHunted>(data['data']);
    }
    if (data['className'] == 'LaserSaber') {
      return deserialize<_i9.LaserSaber>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
