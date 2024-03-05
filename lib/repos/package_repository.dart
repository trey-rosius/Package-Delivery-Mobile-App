import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';


class PackageRepository extends ChangeNotifier {
  PackageRepository.instance();

  final packageNameController = TextEditingController();
  final packageDescriptionController = TextEditingController();
  final deliveryAddressController = TextEditingController();

  String _packageType="Food";
  String _deliveryMode="Standard";
  String _weight = "1KG";
  bool _loading = false;

  List<String> _packageWeightList = [
   "1KG",
    "1KG-5KG",
    "5K-10KG"
  ];


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<String> _packageTypeList = [ "Food",
    "Medication",
    "Electronics",
    "Furniture",
    "Fashion",
    "Beauty",
    "Other"];

  String get weight => _weight;

  set weight(String value) {
    _weight = value;
    notifyListeners();
  }

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

  List<String> get packageWeightList => _packageWeightList;

  set packageWeightList(List<String> value) {
    _packageWeightList = value;
    notifyListeners();
  }
}

