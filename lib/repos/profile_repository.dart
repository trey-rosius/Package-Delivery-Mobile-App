import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'package:aws_common/vm.dart';

import '../models/User.dart';



class ProfileRepository extends ChangeNotifier {

  ProfileRepository.instance();


  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final countryController = TextEditingController();

  final phoneNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();






  bool _loading = false;
  String _userId='';
  int _phoneNumber=0;
  String _address="";

  bool _logout = false;


  String get address => _address;

  set address(String value) {
    _address = value;
    notifyListeners();
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
    notifyListeners();
  }

  bool get logout => _logout;

  set logout(bool value) {
    _logout = value;
    notifyListeners();
  }

  String _profilePicUrl = "";
  String _profilePicKey ="";


  String get profilePicKey => _profilePicKey;

  set profilePicKey(String value) {
    _profilePicKey = value;
    notifyListeners();
  }


  String get profilePicUrl => _profilePicUrl;

  set profilePicUrl(String value) {
    _profilePicUrl = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }


  void showInSnackBar(BuildContext context,String value) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle( fontSize: 20.0),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
    ));
  }



  @override
  void dispose() {
    // TODO: implement dispose

    phoneNumberController.dispose();
    cityController.dispose();
    streetController.dispose();
    countryController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();



    super.dispose();
  }

  Future<String> getProfilePicDownloadUrl({
    required String key,
  }) async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: const StorageGetUrlOptions(
          accessLevel: StorageAccessLevel.guest,
          pluginOptions: S3GetUrlPluginOptions(
            validateObjectExistence: true,
            expiresIn: Duration(days: 1),
          ),
        ),
      ).result;
      return result.url.toString();
    } on StorageException catch (e) {
      safePrint('Could not get a downloadable URL: ${e.message}');
      rethrow;
    }
  }


  Future<void> uploadImage(String imageFilePath,String targetPath) async {
    var uuid =  const Uuid().v1();
    final awsFile = AWSFilePlatform.fromFile(File(imageFilePath));
    try {
      final uploadResult =  await Amplify.Storage.uploadFile(
          key: '$uuid.png',
          localFile: awsFile,

      ).result;


      safePrint('Uploaded file: ${uploadResult.uploadedItem.key}');
      profilePicKey  = uploadResult.uploadedItem.key;

      final resultDownload =
      await getProfilePicDownloadUrl(key: profilePicKey);
      if (kDebugMode) {
        print(resultDownload);
      }
      profilePicUrl = resultDownload;
      loading = false;
      if (kDebugMode) {
        print("the key is $profilePicKey");
      }


    } on StorageException catch (e) {
      safePrint("error message is${e.message}");
      loading= false;
      safePrint('Error uploading file: ${e.message}');
      rethrow;
    }
  }

  Future<bool>signOut() async{
    try {
      Amplify.Auth.signOut();
      return logout = true;
    } on AuthException catch (e) {

      print(e.message);
      return logout  = false;
    }
  }

  Future<void> saveUserDetails(String email,String city, String country, String street,
      double latitude,double longitude,String userType) async {
    loading = true;

    try {
      String graphQLDocument = '''
    mutation createUserAccount(\$username:String!,\$first_name:String!,\$last_name:String!,
    \$email:AWSEmail!,\$user_type:USERTYPE!,\$profile_pic_url:String!,
    \$profile_pic_url:String!,\$phone_number:AWSPhone,\$is_active:Boolean!,
    \$is_admin:Boolean!,\$geolocation:GeolocationInput!,\$address: AddressInput!) {
  createUserAccount(
    userInput: {
      username: \$username
      first_name: \$firstName
      last_name: \$lastName
      email: \$email
      is_admin:\$is_admin
      is_active:\$is_active
      phone_number:\$phone_number
      geolocation:\$geolocation
      address:\$address
      user_type: \$userType
      profile_pic_url:\$profilePicKey
    
    }
  ) {
    created_at
    email
    first_name
    id
    is_active
    is_admin
    geolocation {
      latitude
      longitude
    }
    last_name
    phone_number
    profile_pic_url
    updated_at
    user_type
    username
    address {
      city
      country
      street
      zip
    }
  }
}

    
    ''';

      var operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(
            document: graphQLDocument,
            apiName: "cdk-rust-social-api_AMAZON_COGNITO_USER_POOLS",
            variables: {
              "username": usernameController.text,
              "first_name": firstNameController.text,
              "last_name": lastNameController.text,
              "phone_number":phoneNumberController.text,
              "address":{
                "city": city,
                "country": country,
                "street": street,
                "zip": 237
              },
              "geolocation": { "latitude": latitude, "longitude": longitude},
              "email": email,
              "user_type": userType,
              "profile_pic_url": profilePicUrl,

            },
          ));

      var response = await operation.response;
      if (kDebugMode) {
        print("response operation $response");
      }
      if (response.data != null) {
        final responseJson = json.decode(response.data!);
        if (kDebugMode) {
          print("here${responseJson['createUserAccount']}");
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

  Future<User> getUserAccountById(String userId) async {
    loading = true;


      String graphQLDocument = '''
    
      query getUserAccount(\$userId:String!) {
  getUserAccount(userId:\$userId ) {
    address {
      city
      country
      street
      zip
    }
    created_at
    email
    first_name
    geolocation {
      latitude
      longitude
    }
    id
    is_active
    is_admin
    last_name
    phone_number
    profile_pic_url
    updated_at
    user_type
    username
}
    ''';

      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
            document: graphQLDocument,
            apiName: "packageDeliveryMicroserviceAPI_API_KEY",
            variables: {
              "userId": userId,
            },
          ));

      var response = await operation.response;

      final responseJson = json.decode(response.data!);

      loading = false;

      print("returning ${responseJson['getUserAccount']}");

      User userModel = User.fromJson(responseJson['getUserAccount']);
      if (kDebugMode) {
        print("returning ${userModel.email}");
      }

      return userModel;

  }


  Future<User?> getUserAccountByEmail(String email) async {
    loading = true;

    String graphQLDocument = '''
    
      query getUserAccount(\$id:String!) {
  getUserAccount(id:\$id ) {
  about
  createdOn
  email
  firstName
  id
  lastName
  profilePicUrl
  profilePicKey
   userType
    username
  updatedOn
  }
}
    ''';

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
          apiName: "cdk-rust-social-api_AMAZON_COGNITO_USER_POOLS",
          variables: {
            "email": email,
          },
        ));

    var response = await operation.response;

    final responseJson = json.decode(response.data!);

    loading = false;

    print("returning ${responseJson['getUserByEmail']}");

    if(responseJson['getUserByEmail'] == null){
      return null;
    }else {
      User userModel = User.fromJson(responseJson['getUserByEmail']);
      if (kDebugMode) {
        print("returning ${userModel.email}");
      }



      return userModel;
    }
  }

  Future<AuthUser>retrieveCurrentUser() async{
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    return authUser;
  }

  int get phoneNumber => _phoneNumber;

  set phoneNumber(int value) {
    _phoneNumber = value;
    notifyListeners();
  }
}