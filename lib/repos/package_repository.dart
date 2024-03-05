import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';


class PackageRepository extends ChangeNotifier {
  PackageRepository.instance();

  final packageNameController = TextEditingController();
  final packageDescriptionController = TextEditingController();
  final deliveryAddressController = TextEditingController();

  String _packageType="Food";
  String _deliveryMode="Standard";



  List<String> _packageTypeList = [ "Food",
    "Medication",
    "Electronics",
    "Furniture",
    "Fashion",
    "Beauty",
    "Other"];

  List<String> _deliveryModeList = [
    "Standard",
    "Express",
    "Pro"
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
}

