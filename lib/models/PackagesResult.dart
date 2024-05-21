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
import 'package:collection/collection.dart';

import 'Package.dart';


/** This is an auto generated class representing the PackagesResult type in your schema. */
class PackagesResult {
  final List<Package>? _items;

  List<Package> get items {
    try {
      return _items!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const PackagesResult._internal({required items}): _items = items;
  
  factory PackagesResult({required List<Package> items}) {
    return PackagesResult._internal(
      items: items != null ? List<Package>.unmodifiable(items) : items);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackagesResult &&
      DeepCollectionEquality().equals(_items, other._items);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PackagesResult {");
    buffer.write("items=" + (_items != null ? _items!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PackagesResult copyWith({List<Package>? items}) {
    return PackagesResult._internal(
      items: items ?? this.items);
  }
  
  PackagesResult copyWithModelFieldValues({
    ModelFieldValue<List<Package>>? items
  }) {
    return PackagesResult._internal(
      items: items == null ? this.items : items.value
    );
  }
  
  PackagesResult.fromJson(Map<String, dynamic> json)  
    : _items = json['items'] is List
        ? (json['items'] as List)
          .where((e) => e != null)
          .map((e) => Package.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'items': _items?.map((Package? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'items': _items
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PackagesResult";
    modelSchemaDefinition.pluralName = "PackagesResults";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'items',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Package')
    ));
  });
}