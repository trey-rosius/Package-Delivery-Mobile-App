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

import 'TransactionAddress.dart';


/** This is an auto generated class representing the PackageDeliveryMovement type in your schema. */
class PackageDeliveryMovement {
  final amplify_core.TemporalTimestamp? _createdAt;
  final Geolocation? _currentPackageGeolocation;
  final String? _deliveryAgentId;
  final TransactionAddress? _destinationAddress;
  final String id;
  final String? _packageId;
  final String? _senderId;
  final DELIVERY_STATUS? _status;
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
  
  Geolocation get currentPackageGeolocation {
    try {
      return _currentPackageGeolocation!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get deliveryAgentId {
    try {
      return _deliveryAgentId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TransactionAddress get destinationAddress {
    try {
      return _destinationAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get packageId {
    try {
      return _packageId!;
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

  DELIVERY_STATUS get status {
    try {
      return _status!;
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
  
  const PackageDeliveryMovement._internal({required createdAt, required currentPackageGeolocation, required deliveryAgentId, required destinationAddress, required this.id, required packageId, required senderId, required status, updatedAt}): _createdAt = createdAt, _currentPackageGeolocation = currentPackageGeolocation, _deliveryAgentId = deliveryAgentId, _destinationAddress = destinationAddress, _packageId = packageId, _senderId = senderId, _status = status, _updatedAt = updatedAt;
  
  factory PackageDeliveryMovement({required amplify_core.TemporalTimestamp createdAt, required Geolocation currentPackageGeolocation, required String deliveryAgentId, required TransactionAddress destinationAddress, String? id, required String packageId, required String senderId, required  DELIVERY_STATUS status, amplify_core.TemporalTimestamp? updatedAt}) {
    return PackageDeliveryMovement._internal(
      createdAt: createdAt,
      currentPackageGeolocation: currentPackageGeolocation,
      deliveryAgentId: deliveryAgentId,
      destinationAddress: destinationAddress,
      id: id == null ? amplify_core.UUID.getUUID() : id,
      packageId: packageId,
      senderId: senderId,
      status: status,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackageDeliveryMovement &&
      _createdAt == other._createdAt &&
      _currentPackageGeolocation == other._currentPackageGeolocation &&
      _deliveryAgentId == other._deliveryAgentId &&
      _destinationAddress == other._destinationAddress &&
      id == other.id &&
      _packageId == other._packageId &&
      _senderId == other._senderId &&
      _status == other._status &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PackageDeliveryMovement {");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("currentPackageGeolocation=" + (_currentPackageGeolocation != null ? _currentPackageGeolocation!.toString() : "null") + ", ");
    buffer.write("deliveryAgentId=" + "$_deliveryAgentId" + ", ");
    buffer.write("destinationAddress=" + (_destinationAddress != null ? _destinationAddress!.toString() : "null") + ", ");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("packageId=" + "$_packageId" + ", ");
    buffer.write("senderId=" + "$_senderId" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PackageDeliveryMovement copyWith({amplify_core.TemporalTimestamp? createdAt, Geolocation? currentPackageGeolocation, String? deliveryAgentId, TransactionAddress? destinationAddress, String? id, String? packageId, String? senderId,  DELIVERY_STATUS? status, amplify_core.TemporalTimestamp? updatedAt}) {
    return PackageDeliveryMovement._internal(
      createdAt: createdAt ?? this.createdAt,
      currentPackageGeolocation: currentPackageGeolocation ?? this.currentPackageGeolocation,
      deliveryAgentId: deliveryAgentId ?? this.deliveryAgentId,
      destinationAddress: destinationAddress ?? this.destinationAddress,
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      senderId: senderId ?? this.senderId,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  PackageDeliveryMovement copyWithModelFieldValues({
    ModelFieldValue<amplify_core.TemporalTimestamp>? createdAt,
    ModelFieldValue<Geolocation>? currentPackageGeolocation,
    ModelFieldValue<String>? deliveryAgentId,
    ModelFieldValue<TransactionAddress>? destinationAddress,
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? packageId,
    ModelFieldValue<String>? senderId,
    ModelFieldValue<DELIVERY_STATUS>? status,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? updatedAt
  }) {
    return PackageDeliveryMovement._internal(
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      currentPackageGeolocation: currentPackageGeolocation == null ? this.currentPackageGeolocation : currentPackageGeolocation.value,
      deliveryAgentId: deliveryAgentId == null ? this.deliveryAgentId : deliveryAgentId.value,
      destinationAddress: destinationAddress == null ? this.destinationAddress : destinationAddress.value,
      id: id == null ? this.id : id.value,
      packageId: packageId == null ? this.packageId : packageId.value,
      senderId: senderId == null ? this.senderId : senderId.value,
      status: status == null ? this.status : status.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  PackageDeliveryMovement.fromJson(Map<String, dynamic> json)  
    : _createdAt = json['createdAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _currentPackageGeolocation = json['currentPackageGeolocation'] != null
        ? Geolocation.fromJson(new Map<String, dynamic>.from(json['currentPackageGeolocation']))
        : null,
      _deliveryAgentId = json['deliveryAgentId'],
      _destinationAddress = json['destinationAddress'] != null
        ? TransactionAddress.fromJson(new Map<String, dynamic>.from(json['destinationAddress']))
        : null,
      id = json['id'],
      _packageId = json['packageId'],
      _senderId = json['senderId'],
      _status = amplify_core.enumFromString<DELIVERY_STATUS>(json['status'], DELIVERY_STATUS.values),
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'createdAt': _createdAt?.toSeconds(), 'currentPackageGeolocation': _currentPackageGeolocation?.toJson(), 'deliveryAgentId': _deliveryAgentId, 'destinationAddress': _destinationAddress?.toJson(), 'id': id, 'packageId': _packageId, 'senderId': _senderId, 'status': amplify_core.enumToString(_status), 'updatedAt': _updatedAt?.toSeconds()
  };
  
  Map<String, Object?> toMap() => {
    'createdAt': _createdAt,
    'currentPackageGeolocation': _currentPackageGeolocation,
    'deliveryAgentId': _deliveryAgentId,
    'destinationAddress': _destinationAddress,
    'id': id,
    'packageId': _packageId,
    'senderId': _senderId,
    'status': _status,
    'updatedAt': _updatedAt
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PackageDeliveryMovement";
    modelSchemaDefinition.pluralName = "PackageDeliveryMovements";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'createdAt',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'currentPackageGeolocation',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Geolocation')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'deliveryAgentId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'destinationAddress',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TransactionAddress')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'packageId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'senderId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'updatedAt',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
  });
}