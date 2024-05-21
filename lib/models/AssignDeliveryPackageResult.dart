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

import 'User.dart';


/** This is an auto generated class representing the AssignDeliveryPackageResult type in your schema. */
class AssignDeliveryPackageResult {
  final String? _packageId;
  final User? _user;

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
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const AssignDeliveryPackageResult._internal({required packageId, required user}): _packageId = packageId, _user = user;
  
  factory AssignDeliveryPackageResult({required String packageId, required User user}) {
    return AssignDeliveryPackageResult._internal(
      packageId: packageId,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssignDeliveryPackageResult &&
      _packageId == other._packageId &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AssignDeliveryPackageResult {");
    buffer.write("packageId=" + "$_packageId" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AssignDeliveryPackageResult copyWith({String? packageId, User? user}) {
    return AssignDeliveryPackageResult._internal(
      packageId: packageId ?? this.packageId,
      user: user ?? this.user);
  }
  
  AssignDeliveryPackageResult copyWithModelFieldValues({
    ModelFieldValue<String>? packageId,
    ModelFieldValue<User>? user
  }) {
    return AssignDeliveryPackageResult._internal(
      packageId: packageId == null ? this.packageId : packageId.value,
      user: user == null ? this.user : user.value
    );
  }
  
  AssignDeliveryPackageResult.fromJson(Map<String, dynamic> json)  
    : _packageId = json['packageId'],
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'packageId': _packageId, 'user': _user?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'packageId': _packageId,
    'user': _user
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AssignDeliveryPackageResult";
    modelSchemaDefinition.pluralName = "AssignDeliveryPackageResults";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'packageId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'user',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'User')
    ));
  });
}