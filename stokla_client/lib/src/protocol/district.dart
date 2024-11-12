/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class District implements _i1.SerializableModel {
  District._({
    this.id,
    required this.cityId,
    required this.name,
  });

  factory District({
    int? id,
    required int cityId,
    required String name,
  }) = _DistrictImpl;

  factory District.fromJson(Map<String, dynamic> jsonSerialization) {
    return District(
      id: jsonSerialization['id'] as int?,
      cityId: jsonSerialization['cityId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int cityId;

  String name;

  District copyWith({
    int? id,
    int? cityId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'cityId': cityId,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DistrictImpl extends District {
  _DistrictImpl({
    int? id,
    required int cityId,
    required String name,
  }) : super._(
          id: id,
          cityId: cityId,
          name: name,
        );

  @override
  District copyWith({
    Object? id = _Undefined,
    int? cityId,
    String? name,
  }) {
    return District(
      id: id is int? ? id : this.id,
      cityId: cityId ?? this.cityId,
      name: name ?? this.name,
    );
  }
}
