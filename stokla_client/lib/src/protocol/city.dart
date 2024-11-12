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

abstract class City implements _i1.SerializableModel {
  City._({
    this.id,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.cityCode,
  });

  factory City({
    int? id,
    required String name,
    required String country,
    required String countryCode,
    required int cityCode,
  }) = _CityImpl;

  factory City.fromJson(Map<String, dynamic> jsonSerialization) {
    return City(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      country: jsonSerialization['country'] as String,
      countryCode: jsonSerialization['countryCode'] as String,
      cityCode: jsonSerialization['cityCode'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String country;

  String countryCode;

  int cityCode;

  City copyWith({
    int? id,
    String? name,
    String? country,
    String? countryCode,
    int? cityCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'cityCode': cityCode,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CityImpl extends City {
  _CityImpl({
    int? id,
    required String name,
    required String country,
    required String countryCode,
    required int cityCode,
  }) : super._(
          id: id,
          name: name,
          country: country,
          countryCode: countryCode,
          cityCode: cityCode,
        );

  @override
  City copyWith({
    Object? id = _Undefined,
    String? name,
    String? country,
    String? countryCode,
    int? cityCode,
  }) {
    return City(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      cityCode: cityCode ?? this.cityCode,
    );
  }
}
