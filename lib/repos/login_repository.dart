


import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';
import '../utils/sign_in_with_web_ui_options.dart';
import '../utils/shared_preferences.dart';





class LoginRepository extends ChangeNotifier{


  LoginRepository.instance();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();


  bool _isSignedIn = false;
  bool _loading = false;
  bool _obscureText = true;
  bool _isValidEmail = false;

  bool _loadingAmplify  = true;



  bool get isValidEmail => _isValidEmail;


  bool get loadingAmplify => _loadingAmplify;

  set loadingAmplify(bool value) {
    _loadingAmplify = value;
    notifyListeners();
  }

  set isValidEmail(bool value) {
    _isValidEmail = value;
    notifyListeners();
  }

  String _groupName = 'parent';


  String get groupName => _groupName;

  set groupName(String value) {
    _groupName = value;
    notifyListeners();
  }



  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool _googleLoading = false;

  bool _isOTPSignUpComplete = false;

  bool _isSignUpComplete = false;
  bool get isSignedIn => _isSignedIn;

  bool get isSignUpComplete => _isSignUpComplete;

  set isSignUpComplete(bool value) {
    _isSignUpComplete = value;
    notifyListeners();
  }

  set isSignedIn(bool value) {
    _isSignedIn = value;
    notifyListeners();
  }

  showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: const TextStyle(fontSize: 20),)));
  }


  bool get isOTPSignUpComplete => _isOTPSignUpComplete;

  set isOTPSignUpComplete(bool value) {
    _isOTPSignUpComplete = value;
    notifyListeners();
  }

  bool get googleLoading => _googleLoading;

  set googleLoading(bool value) {
    _googleLoading = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<User?> googleSignIn(BuildContext context) async {
    googleLoading = true;
    try {
      var res =
      await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      


      isSignedIn = res.isSignedIn;
      if (isSignedIn) {
        return fetchCurrentUserAttributes()
            .then((List<AuthUserAttribute> listUserAttributes) async {


          User? user;

          for (var item in listUserAttributes) {
            if (item.userAttributeKey.key == 'email') {
            //  user = await getUserAccountByEmail(item.value);
              //save email to shared preferences

              await SharedPrefsUtils.instance()
                  .saveUserEmail(item.value)
                  .then((value) {
                if (kDebugMode) {
                  print("email address saved");
                }
                googleLoading = false;
                return item.value;
              });

            }
          }


          return user;
        });
      } else {
        googleLoading = false;
        return null;
      }
    } on AmplifyException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }

      googleLoading = false;
      return null;
    }
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();

    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<List<AuthUserAttribute>> fetchCurrentUserAttributes() async {

    try {
      List<AuthUserAttribute> result = await Amplify.Auth.fetchUserAttributes();



      return result;
    } on AuthException {

     rethrow;
    }
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    passwordController.dispose();
    emailController.dispose();
  }


}
