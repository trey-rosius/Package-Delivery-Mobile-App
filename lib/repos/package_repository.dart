import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';


class PackageRepository extends ChangeNotifier {
  PackageRepository.instance();

  final packageNameController = TextEditingController();
  final packageDescriptionController = TextEditingController();
  final deliveryAddressController = TextEditingController();

  String _packageStatus="PENDING";
  String _packageType="FOOD";
  String _deliveryMode="NORMAL";

  List<String> _packageStatusList =[ "PENDING",
    "ASSIGNED",
    "PICKED_UP",
    "IN_TRANSIT",
    "DELIVERED",
    "CANCELLED"];

  List<String> _packageTypeList = [ " FOOD",
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


  List<String> get packageStatusList => _packageStatusList;

  set packageStatusList(List<String> value) {
    _packageStatusList = value;
    notifyListeners();
  }

  String get packageStatus => _packageStatus;

  set packageStatus(String value) {
    _packageStatus = value;
    notifyListeners();
  }

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

