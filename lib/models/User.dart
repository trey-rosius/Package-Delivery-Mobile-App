/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

import 'USERTYPE.dart';


/** This is an auto generated class representing the User type in your schema. */
class User {
  final Address? _address;
  final amplify_core.TemporalTimestamp? _created_at;
  final String? _email;
  final String? _first_name;
  final Geolocation? _geolocation;
  final String id;
  final bool? _is_active;
  final bool? _is_admin;
  final String? _last_name;
  final String? _phone_number;
  final String? _profile_pic_url;
  final amplify_core.TemporalTimestamp? _updated_at;
  final USERTYPE? _user_type;
  final String? _username;

  Address get address {
    try {
      return _address!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalTimestamp? get created_at {
    return _created_at;
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get first_name {
    try {
      return _first_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Geolocation get geolocation {
    try {
      return _geolocation!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get is_active {
    try {
      return _is_active!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get is_admin {
    try {
      return _is_admin!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get last_name {
    try {
      return _last_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phone_number {
    try {
      return _phone_number!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get profile_pic_url {
    try {
      return _profile_pic_url!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalTimestamp? get updated_at {
    return _updated_at;
  }
  
  USERTYPE get user_type {
    try {
      return _user_type!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get username {
    try {
      return _username!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const User._internal({required address, created_at, required email, required first_name, required geolocation, required this.id, required is_active, required is_admin, required last_name, required phone_number, required profile_pic_url, updated_at, required user_type, required username}): _address = address, _created_at = created_at, _email = email, _first_name = first_name, _geolocation = geolocation, _is_active = is_active, _is_admin = is_admin, _last_name = last_name, _phone_number = phone_number, _profile_pic_url = profile_pic_url, _updated_at = updated_at, _user_type = user_type, _username = username;
  
  factory User({required Address address, amplify_core.TemporalTimestamp? created_at, required String email, required String first_name, required Geolocation geolocation, String? id, required bool is_active, required bool is_admin, required String last_name, required String phone_number, required String profile_pic_url, amplify_core.TemporalTimestamp? updated_at, required USERTYPE user_type, required String username}) {
    return User._internal(
      address: address,
      created_at: created_at,
      email: email,
      first_name: first_name,
      geolocation: geolocation,
      id: id == null ? amplify_core.UUID.getUUID() : id,
      is_active: is_active,
      is_admin: is_admin,
      last_name: last_name,
      phone_number: phone_number,
      profile_pic_url: profile_pic_url,
      updated_at: updated_at,
      user_type: user_type,
      username: username);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      _address == other._address &&
      _created_at == other._created_at &&
      _email == other._email &&
      _first_name == other._first_name &&
      _geolocation == other._geolocation &&
      id == other.id &&
      _is_active == other._is_active &&
      _is_admin == other._is_admin &&
      _last_name == other._last_name &&
      _phone_number == other._phone_number &&
      _profile_pic_url == other._profile_pic_url &&
      _updated_at == other._updated_at &&
      _user_type == other._user_type &&
      _username == other._username;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("address=" + (_address != null ? _address!.toString() : "null") + ", ");
    buffer.write("created_at=" + (_created_at != null ? _created_at!.toString() : "null") + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("first_name=" + "$_first_name" + ", ");
    buffer.write("geolocation=" + (_geolocation != null ? _geolocation!.toString() : "null") + ", ");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("is_active=" + (_is_active != null ? _is_active!.toString() : "null") + ", ");
    buffer.write("is_admin=" + (_is_admin != null ? _is_admin!.toString() : "null") + ", ");
    buffer.write("last_name=" + "$_last_name" + ", ");
    buffer.write("phone_number=" + "$_phone_number" + ", ");
    buffer.write("profile_pic_url=" + "$_profile_pic_url" + ", ");
    buffer.write("updated_at=" + (_updated_at != null ? _updated_at!.toString() : "null") + ", ");
    buffer.write("user_type=" + (_user_type != null ? amplify_core.enumToString(_user_type)! : "null") + ", ");
    buffer.write("username=" + "$_username");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({Address? address, amplify_core.TemporalTimestamp? created_at, String? email, String? first_name, Geolocation? geolocation, String? id, bool? is_active, bool? is_admin, String? last_name, String? phone_number, String? profile_pic_url, amplify_core.TemporalTimestamp? updated_at, USERTYPE? user_type, String? username}) {
    return User._internal(
      address: address ?? this.address,
      created_at: created_at ?? this.created_at,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      geolocation: geolocation ?? this.geolocation,
      id: id ?? this.id,
      is_active: is_active ?? this.is_active,
      is_admin: is_admin ?? this.is_admin,
      last_name: last_name ?? this.last_name,
      phone_number: phone_number ?? this.phone_number,
      profile_pic_url: profile_pic_url ?? this.profile_pic_url,
      updated_at: updated_at ?? this.updated_at,
      user_type: user_type ?? this.user_type,
      username: username ?? this.username);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<Address>? address,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? created_at,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? first_name,
    ModelFieldValue<Geolocation>? geolocation,
    ModelFieldValue<String>? id,
    ModelFieldValue<bool>? is_active,
    ModelFieldValue<bool>? is_admin,
    ModelFieldValue<String>? last_name,
    ModelFieldValue<String>? phone_number,
    ModelFieldValue<String>? profile_pic_url,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? updated_at,
    ModelFieldValue<USERTYPE>? user_type,
    ModelFieldValue<String>? username
  }) {
    return User._internal(
      address: address == null ? this.address : address.value,
      created_at: created_at == null ? this.created_at : created_at.value,
      email: email == null ? this.email : email.value,
      first_name: first_name == null ? this.first_name : first_name.value,
      geolocation: geolocation == null ? this.geolocation : geolocation.value,
      id: id == null ? this.id : id.value,
      is_active: is_active == null ? this.is_active : is_active.value,
      is_admin: is_admin == null ? this.is_admin : is_admin.value,
      last_name: last_name == null ? this.last_name : last_name.value,
      phone_number: phone_number == null ? this.phone_number : phone_number.value,
      profile_pic_url: profile_pic_url == null ? this.profile_pic_url : profile_pic_url.value,
      updated_at: updated_at == null ? this.updated_at : updated_at.value,
      user_type: user_type == null ? this.user_type : user_type.value,
      username: username == null ? this.username : username.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : _address = json['address'] != null
        ? Address.fromJson(new Map<String, dynamic>.from(json['address']))
        : null,
      _created_at = json['created_at'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['created_at']) : null,
      _email = json['email'],
      _first_name = json['first_name'],
      _geolocation = json['geolocation'] != null
        ? Geolocation.fromJson(new Map<String, dynamic>.from(json['geolocation']))
        : null,
      id = json['id'],
      _is_active = json['is_active'],
      _is_admin = json['is_admin'],
      _last_name = json['last_name'],
      _phone_number = json['phone_number'],
      _profile_pic_url = json['profile_pic_url'],
      _updated_at = json['updated_at'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['updated_at']) : null,
      _user_type = amplify_core.enumFromString<USERTYPE>(json['user_type'], USERTYPE.values),
      _username = json['username'];
  
  Map<String, dynamic> toJson() => {
    'address': _address?.toJson(), 'created_at': _created_at?.toSeconds(), 'email': _email, 'first_name': _first_name, 'geolocation': _geolocation?.toJson(), 'id': id, 'is_active': _is_active, 'is_admin': _is_admin, 'last_name': _last_name, 'phone_number': _phone_number, 'profile_pic_url': _profile_pic_url, 'updated_at': _updated_at?.toSeconds(), 'user_type': amplify_core.enumToString(_user_type), 'username': _username
  };
  
  Map<String, Object?> toMap() => {
    'address': _address,
    'created_at': _created_at,
    'email': _email,
    'first_name': _first_name,
    'geolocation': _geolocation,
    'id': id,
    'is_active': _is_active,
    'is_admin': _is_admin,
    'last_name': _last_name,
    'phone_number': _phone_number,
    'profile_pic_url': _profile_pic_url,
    'updated_at': _updated_at,
    'user_type': _user_type,
    'username': _username
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'address',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Address')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'created_at',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'email',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'first_name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'geolocation',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Geolocation')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'is_active',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'is_admin',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'last_name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'phone_number',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'profile_pic_url',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'updated_at',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'user_type',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'username',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}