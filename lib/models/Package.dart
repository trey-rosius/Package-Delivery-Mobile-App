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

import 'package:package_delivery/models/PACKAGE_DELIVERY_MODE.dart';
import 'package:package_delivery/models/PACKAGE_STATUS.dart';
import 'package:package_delivery/models/PACKAGE_TYPE.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

import 'TransactionAddress.dart';


/** This is an auto generated class representing the Package type in your schema. */
class Package {
  final amplify_core.TemporalTimestamp? _createdAt;
  final TransactionAddress? _deliveryAddress;
  final String? _deliveryAgentId;
  final PACKAGE_DELIVERY_MODE? _deliveryMode;
  final String id;
  final String? _packageDescription;
  final String? _packageName;
  final PACKAGE_STATUS? _packageStatus;
  final PACKAGE_TYPE? _packageType;
  final TransactionAddress? _pickupAddress;
  final String? _senderId;
  final amplify_core.TemporalTimestamp? _updatedAt;

  amplify_core.TemporalTimestamp get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TransactionAddress get deliveryAddress {
    try {
      return _deliveryAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get deliveryAgentId {
    return _deliveryAgentId;
  }
  
PACKAGE_DELIVERY_MODE get deliveryMode {
    try {
      return _deliveryMode!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get packageDescription {
    try {
      return _packageDescription!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get packageName {
    try {
      return _packageName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
 PACKAGE_STATUS get packageStatus {
    try {
      return _packageStatus!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  PACKAGE_TYPE get packageType {
    try {
      return _packageType!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TransactionAddress get pickupAddress {
    try {
      return _pickupAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get senderId {
    try {
      return _senderId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalTimestamp? get updatedAt {
    return _updatedAt;
  }
  
  const Package._internal({required createdAt, required deliveryAddress, deliveryAgentId, required deliveryMode, required this.id, required packageDescription, required packageName, required packageStatus, required packageType, required pickupAddress, required senderId, updatedAt}): _createdAt = createdAt, _deliveryAddress = deliveryAddress, _deliveryAgentId = deliveryAgentId, _deliveryMode = deliveryMode, _packageDescription = packageDescription, _packageName = packageName, _packageStatus = packageStatus, _packageType = packageType, _pickupAddress = pickupAddress, _senderId = senderId, _updatedAt = updatedAt;
  
  factory Package({required amplify_core.TemporalTimestamp createdAt, required TransactionAddress deliveryAddress, String? deliveryAgentId, required PACKAGE_DELIVERY_MODE deliveryMode, String? id, required String packageDescription, required String packageName,  PACKAGE_STATUS? packageStatus, PACKAGE_TYPE? packageType, required TransactionAddress pickupAddress, required String senderId, amplify_core.TemporalTimestamp? updatedAt}) {
    return Package._internal(
      createdAt: createdAt,
      deliveryAddress: deliveryAddress,
      deliveryAgentId: deliveryAgentId,
      deliveryMode: deliveryMode,
      id: id == null ? amplify_core.UUID.getUUID() : id,
      packageDescription: packageDescription,
      packageName: packageName,
      packageStatus: packageStatus,
      packageType: packageType,
      pickupAddress: pickupAddress,
      senderId: senderId,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Package &&
      _createdAt == other._createdAt &&
      _deliveryAddress == other._deliveryAddress &&
      _deliveryAgentId == other._deliveryAgentId &&
      _deliveryMode == other._deliveryMode &&
      id == other.id &&
      _packageDescription == other._packageDescription &&
      _packageName == other._packageName &&
      _packageStatus == other._packageStatus &&
      _packageType == other._packageType &&
      _pickupAddress == other._pickupAddress &&
      _senderId == other._senderId &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Package {");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("deliveryAddress=" + (_deliveryAddress != null ? _deliveryAddress!.toString() : "null") + ", ");
    buffer.write("deliveryAgentId=" + "$_deliveryAgentId" + ", ");
    buffer.write("deliveryMode=" + (_deliveryMode != null ? amplify_core.enumToString(_deliveryMode)! : "null") + ", ");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("packageDescription=" + "$_packageDescription" + ", ");
    buffer.write("packageName=" + "$_packageName" + ", ");
    buffer.write("packageStatus=" + (_packageStatus != null ? amplify_core.enumToString(_packageStatus)! : "null") + ", ");
    buffer.write("packageType=" + (_packageType != null ? amplify_core.enumToString(_packageType)! : "null") + ", ");
    buffer.write("pickupAddress=" + (_pickupAddress != null ? _pickupAddress!.toString() : "null") + ", ");
    buffer.write("senderId=" + "$_senderId" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Package copyWith({amplify_core.TemporalTimestamp? createdAt, TransactionAddress? deliveryAddress, String? deliveryAgentId, PACKAGE_DELIVERY_MODE? deliveryMode, String? id, String? packageDescription, String? packageName, PACKAGE_STATUS? packageStatus, PACKAGE_TYPE? packageType, TransactionAddress? pickupAddress, String? senderId, amplify_core.TemporalTimestamp? updatedAt}) {
    return Package._internal(
      createdAt: createdAt ?? this.createdAt,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryAgentId: deliveryAgentId ?? this.deliveryAgentId,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      id: id ?? this.id,
      packageDescription: packageDescription ?? this.packageDescription,
      packageName: packageName ?? this.packageName,
      packageStatus: packageStatus ?? this.packageStatus,
      packageType: packageType ?? this.packageType,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      senderId: senderId ?? this.senderId,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Package copyWithModelFieldValues({
    ModelFieldValue<amplify_core.TemporalTimestamp>? createdAt,
    ModelFieldValue<TransactionAddress>? deliveryAddress,
    ModelFieldValue<String?>? deliveryAgentId,
    ModelFieldValue<PACKAGE_DELIVERY_MODE>? deliveryMode,
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? packageDescription,
    ModelFieldValue<String>? packageName,
    ModelFieldValue<PACKAGE_STATUS>? packageStatus,
    ModelFieldValue<PACKAGE_TYPE>? packageType,
    ModelFieldValue<TransactionAddress>? pickupAddress,
    ModelFieldValue<String>? senderId,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? updatedAt
  }) {
    return Package._internal(
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      deliveryAddress: deliveryAddress == null ? this.deliveryAddress : deliveryAddress.value,
      deliveryAgentId: deliveryAgentId == null ? this.deliveryAgentId : deliveryAgentId.value,
      deliveryMode: deliveryMode == null ? this.deliveryMode : deliveryMode.value,
      id: id == null ? this.id : id.value,
      packageDescription: packageDescription == null ? this.packageDescription : packageDescription.value,
      packageName: packageName == null ? this.packageName : packageName.value,
      packageStatus: packageStatus == null ? this.packageStatus : packageStatus.value,
      packageType: packageType == null ? this.packageType : packageType.value,
      pickupAddress: pickupAddress == null ? this.pickupAddress : pickupAddress.value,
      senderId: senderId == null ? this.senderId : senderId.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  Package.fromJson(Map<String, dynamic> json)  
    : _createdAt = json['createdAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _deliveryAddress = json['deliveryAddress'] != null
        ? TransactionAddress.fromJson(new Map<String, dynamic>.from(json['deliveryAddress']))
        : null,
      _deliveryAgentId = json['deliveryAgentId'],
      _deliveryMode = amplify_core.enumFromString<PACKAGE_DELIVERY_MODE>(json['deliveryMode'], PACKAGE_DELIVERY_MODE.values),
      id = json['id'],
      _packageDescription = json['packageDescription'],
      _packageName = json['packageName'],
      _packageStatus = amplify_core.enumFromString<PACKAGE_STATUS>(json['packageStatus'], PACKAGE_STATUS.values),
      _packageType = amplify_core.enumFromString<PACKAGE_TYPE>(json['packageType'], PACKAGE_TYPE.values),
      _pickupAddress = json['pickupAddress'] != null
        ? TransactionAddress.fromJson(new Map<String, dynamic>.from(json['pickupAddress']))
        : null,
      _senderId = json['senderId'],
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'createdAt': _createdAt?.toSeconds(), 'deliveryAddress': _deliveryAddress?.toJson(), 'deliveryAgentId': _deliveryAgentId, 'deliveryMode': amplify_core.enumToString(_deliveryMode), 'id': id, 'packageDescription': _packageDescription, 'packageName': _packageName, 'packageStatus': amplify_core.enumToString(_packageStatus), 'packageType': amplify_core.enumToString(_packageType), 'pickupAddress': _pickupAddress?.toJson(), 'senderId': _senderId, 'updatedAt': _updatedAt?.toSeconds()
  };
  
  Map<String, Object?> toMap() => {
    'createdAt': _createdAt,
    'deliveryAddress': _deliveryAddress,
    'deliveryAgentId': _deliveryAgentId,
    'deliveryMode': _deliveryMode,
    'id': id,
    'packageDescription': _packageDescription,
    'packageName': _packageName,
    'packageStatus': _packageStatus,
    'packageType': _packageType,
    'pickupAddress': _pickupAddress,
    'senderId': _senderId,
    'updatedAt': _updatedAt
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Package";
    modelSchemaDefinition.pluralName = "Packages";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'createdAt',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'deliveryAddress',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TransactionAddress')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'deliveryAgentId',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'deliveryMode',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'packageDescription',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'packageName',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'packageStatus',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'packageType',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'pickupAddress',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TransactionAddress')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'senderId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'updatedAt',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
  });
}