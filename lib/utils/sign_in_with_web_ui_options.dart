import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

  class SignInWithWebClientMetadata extends CognitoSignInWithWebUIPluginOptions{

    SignInWithWebClientMetadata({
      required this.groupName
  });
    final String groupName;
    @override
    // TODO: implement props
    List<Object?> get props => [groupName];

    @override
    // TODO: implement runtimeTypeName
    String get runtimeTypeName => 'SignInWithWebClientMetadata';

    @override
    Map<String, Object?> toJson() {
      return {
        "clientMetadata":{
          "group":groupName
        }
      };


    }




  }