import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';

import 'package:amplify_flutter/amplify_flutter.dart';


class LocationRepository extends ChangeNotifier{
  LocationRepository.instance();


  Future<bool> packageTimelapse(double longitude, double latitude) async {
    if (kDebugMode) {
      print("longitude is $longitude");
      print("longitude is $latitude");
    }



    try {
      String graphQlDoc = '''
 mutation packageTimelapse(\$longitude: Float!
  \$latitude: Float!
  \$deliveryAgentId: String!
  \$packageId: String!) {
  packageTimelapse(input: {deliveryAgentId: \$deliveryAgentId, latitude: \$latitude, longitude:\$longitude, packageId: \$packageId}) {
    latitude
    longitude
    id
    timestamp
  }
}
''';


      var operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(
            document: graphQlDoc,
            apiName: "package-delivery-tidy-lizard",
            variables: {
              "deliveryAgentId": "rosius@gmail.com",
              "longitude": longitude,
              "latitude": latitude,
              "packageId": "2WcmvU2MKCD7ZzzY9sB62OoUofs",
            },
          ));

      var response = await operation.response;

      if (response.data != null) {
        var data = json.decode(response.data!);
        if (kDebugMode) {
          print('Mutation result is${data!}');

        }



        return true;
      } else {
        if (kDebugMode) {
          print('Mutation error: ${response.errors}');
        }

        return false;
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex.toString());
      }

      return false;
    }
  }

}