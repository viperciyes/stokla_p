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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.businessname,
    required this.businessphone,
    required this.mobilephone,
    required this.businessaddress,
    required this.taxno,
    required this.taxname,
    required this.mersisno,
    required this.passwordHash,
    required this.role,
    required this.isApproved,
    required this.isCompleted,
    this.serverpodUserId,
    required this.userInfoId,
    this.userInfo,
  });

  factory User({
    int? id,
    required String email,
    required String name,
    required String surname,
    required String businessname,
    required String businessphone,
    required String mobilephone,
    required String businessaddress,
    required String taxno,
    required String taxname,
    required String mersisno,
    required String passwordHash,
    required String role,
    required bool isApproved,
    required bool isCompleted,
    int? serverpodUserId,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      name: jsonSerialization['name'] as String,
      surname: jsonSerialization['surname'] as String,
      businessname: jsonSerialization['businessname'] as String,
      businessphone: jsonSerialization['businessphone'] as String,
      mobilephone: jsonSerialization['mobilephone'] as String,
      businessaddress: jsonSerialization['businessaddress'] as String,
      taxno: jsonSerialization['taxno'] as String,
      taxname: jsonSerialization['taxname'] as String,
      mersisno: jsonSerialization['mersisno'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      role: jsonSerialization['role'] as String,
      isApproved: jsonSerialization['isApproved'] as bool,
      isCompleted: jsonSerialization['isCompleted'] as bool,
      serverpodUserId: jsonSerialization['serverpodUserId'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String name;

  String surname;

  String businessname;

  String businessphone;

  String mobilephone;

  String businessaddress;

  String taxno;

  String taxname;

  String mersisno;

  String passwordHash;

  String role;

  bool isApproved;

  bool isCompleted;

  int? serverpodUserId;

  int userInfoId;

  _i2.UserInfo? userInfo;

  User copyWith({
    int? id,
    String? email,
    String? name,
    String? surname,
    String? businessname,
    String? businessphone,
    String? mobilephone,
    String? businessaddress,
    String? taxno,
    String? taxname,
    String? mersisno,
    String? passwordHash,
    String? role,
    bool? isApproved,
    bool? isCompleted,
    int? serverpodUserId,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'businessname': businessname,
      'businessphone': businessphone,
      'mobilephone': mobilephone,
      'businessaddress': businessaddress,
      'taxno': taxno,
      'taxname': taxname,
      'mersisno': mersisno,
      'passwordHash': passwordHash,
      'role': role,
      'isApproved': isApproved,
      'isCompleted': isCompleted,
      if (serverpodUserId != null) 'serverpodUserId': serverpodUserId,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String email,
    required String name,
    required String surname,
    required String businessname,
    required String businessphone,
    required String mobilephone,
    required String businessaddress,
    required String taxno,
    required String taxname,
    required String mersisno,
    required String passwordHash,
    required String role,
    required bool isApproved,
    required bool isCompleted,
    int? serverpodUserId,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
          id: id,
          email: email,
          name: name,
          surname: surname,
          businessname: businessname,
          businessphone: businessphone,
          mobilephone: mobilephone,
          businessaddress: businessaddress,
          taxno: taxno,
          taxname: taxname,
          mersisno: mersisno,
          passwordHash: passwordHash,
          role: role,
          isApproved: isApproved,
          isCompleted: isCompleted,
          serverpodUserId: serverpodUserId,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? name,
    String? surname,
    String? businessname,
    String? businessphone,
    String? mobilephone,
    String? businessaddress,
    String? taxno,
    String? taxname,
    String? mersisno,
    String? passwordHash,
    String? role,
    bool? isApproved,
    bool? isCompleted,
    Object? serverpodUserId = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      businessname: businessname ?? this.businessname,
      businessphone: businessphone ?? this.businessphone,
      mobilephone: mobilephone ?? this.mobilephone,
      businessaddress: businessaddress ?? this.businessaddress,
      taxno: taxno ?? this.taxno,
      taxname: taxname ?? this.taxname,
      mersisno: mersisno ?? this.mersisno,
      passwordHash: passwordHash ?? this.passwordHash,
      role: role ?? this.role,
      isApproved: isApproved ?? this.isApproved,
      isCompleted: isCompleted ?? this.isCompleted,
      serverpodUserId:
          serverpodUserId is int? ? serverpodUserId : this.serverpodUserId,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}
