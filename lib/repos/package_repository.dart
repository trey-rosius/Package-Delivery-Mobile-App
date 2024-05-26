import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';


class PackageRepository extends ChangeNotifier {
  PackageRepository.instance();

  final packageNameController = TextEditingController();
  final packageDescriptionController = TextEditingController();
  final deliveryAddressController = TextEditingController();

  String _packageType="FOOD";
  String _deliveryMode="NORMAL";
  bool _loading = false;



  double _longitude=0.0;
  double _latitude=0.0;


  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
    notifyListeners();
  }


  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<String> _packageTypeList = [
    "FOOD",
    "MEDICATION",
    "ELECTRONICS",
    "FURNITURE",
    "FASHION",
   "BEAUTY",
    "OTHER"];



  List<String> _deliveryModeList = [
    "NORMAL",
    "EXPRESS",
    "PRO"
  ];



  String get packageType => _packageType;

  set packageType(String value) {
    _packageType = value;
    notifyListeners();
  }

  String get deliveryMode => _deliveryMode;

  set deliveryMode(String value) {
    _deliveryMode = value;
    notifyListeners();
  }

  @override
  void dispose() {

    super.dispose();

   packageNameController.dispose();
  packageDescriptionController.dispose();
  deliveryAddressController.dispose();
  }

  List<String> get packageTypeList => _packageTypeList;

  set packageTypeList(List<String> value) {
    _packageTypeList = value;
    notifyListeners();
  }

  List<String> get deliveryModeList => _deliveryModeList;

  set deliveryModeList(List<String> value) {
    _deliveryModeList = value;
    notifyListeners();
  }



  Future<void> createPackage(String userId) async {
    loading = true;

    try {
      String graphQLDocument = '''
    mutation createPackage( \$packageName: String!
  \$packageDescription: String!
  \$deliveryAddress: TransactionAddressInput!
  \$pickupAddress: TransactionAddressInput!
  \$senderId: String!
  \$packageStatus: PACKAGE_STATUS!
  \$packageType: PACKAGE_TYPE!
  \$deliveryMode: PACKAGE_DELIVERY_MODE!) {
  createPackage(
    userInput: {
       packageName: \$packageName
  packageDescription: \$packageDescription
  deliveryAddress: \$deliveryAddress
  pickupAddress: \$pickupAddress
  senderId: \$senderId
  packageStatus: \$packageStatus
  packageType: \$packageType
  deliveryMode: \$deliveryMode
    
    }
  ) {
     deliveryAddress {
      city
      country
      latitude
      longitude
      street
      zip
    }
    createdAt
    deliveryAgentId
    deliveryMode
    id
    packageDescription
    packageName
    packageStatus
    packageType
    pickupAddress {
      city
      country
      latitude
      longitude
      street
      zip
    }
    senderId
    updatedAt
  }
}

    
    ''';

      var operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(
            document: graphQLDocument,
            apiName: "packageDeliveryMicroserviceAPI_API_KEY",
            variables: {
              "packageName": packageNameController.text,
              "packageDescription": packageDescriptionController.text,
              "pickupAddress": {
                "city": "Douala",
                "street": "Makepe",
                "zip": 237,
                "country": "Cameroon",
                "latitude": latitude,
                "longitude": longitude
              },
              "deliveryAddress": {
                "city": "Douala",
                "street": "Bonamoussaddi",
                "zip": 237,
                "country": "Cameroon",
                "latitude": 4.0938311,
                "longitude":  9.7508429
              },
              "packageStatus": "PENDING",
              "packageType": packageType,
              "deliveryMode": deliveryMode,
              "senderId": userId

            },
          ));

      var response = await operation.response;
      if (kDebugMode) {
        print("response operation $response");
      }
      if (response.data != null) {
        final responseJson = json.decode(response.data!);
        if (kDebugMode) {
          print("here${responseJson['createPackage']}");
        }
        loading = false;
      } else {
        if (kDebugMode) {
          print("something happened");
        }
        loading = false;
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex.toString());
      }
      loading = false;
    }
  }

}

