import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import 'package:flutter_map/models/model.dart';

class ApiClient {
  static const baseUrl = 'https://maps.googleapis.com/maps';
  final http.Client httpClient;

  const ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Place>> getPlaces({
    @required LatLng location,
    @required int radius,
    @required String type,
  }) async {
    final newResponse = {
      "html_attributions": [],
      "results": [
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4216249, "lng": -122.1022678},
            "viewport": {
              "northeast": {"lat": 37.4229625302915, "lng": -122.1007575697085},
              "southwest": {"lat": 37.4202645697085, "lng": -122.1034555302915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/atm-71.png",
          "id": "edbb7a77a1992031817c45297ff044e76d223629",
          "name": "Cardtronics ATM",
          "opening_hours": {"open_now": true},
          "place_id": "ChIJn2aFNxK6j4ARFW0mLrbePJA",
          "plus_code": {
            "compound_code": "CVCX+J3 Palo Alto, CA, United States",
            "global_code": "849VCVCX+J3"
          },
          "rating": 2,
          "reference": "ChIJn2aFNxK6j4ARFW0mLrbePJA",
          "scope": "GOOGLE",
          "types": ["atm", "finance", "point_of_interest", "establishment"],
          "user_ratings_total": 1,
          "vicinity": "835 San Antonio Road, Palo Alto"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4114017, "lng": -122.0936527},
            "viewport": {
              "northeast": {
                "lat": 37.41272133029149,
                "lng": -122.0922337197085
              },
              "southwest": {"lat": 37.41002336970849, "lng": -122.0949316802915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
          "id": "9af7d18f39a0f62eb858f3b1c5de57af87910175",
          "name": "Meriwest Credit Union",
          "opening_hours": {"open_now": false},
          "photos": [
            {
              "height": 2016,
              "html_attributions": [
                "\u003ca href=\"https://maps.google.com/maps/contrib/101085746671204518058\"\u003eMeriwest Credit Union\u003c/a\u003e"
              ],
              "photo_reference":
                  "CmRaAAAACi0tMfKvWUZR5B_QnH_kjmUDNMXvy66xUO3x4rZwJ3MOi6MK41qelB2IZeldKLnBoo1y2tZAn3F26t3kyW9wAcWDfz10kkHwwyhlbPkKYqP1aPE60EEZTtSULSYSQ1hpEhCRveT9aCemt1vmtD33LZrIGhR0yUBa29jG0PcqIeeflX58_Q1IgQ",
              "width": 1512
            }
          ],
          "place_id": "ChIJs-JGWqiwj4ARSCUZWmywZ_Q",
          "plus_code": {
            "compound_code": "CW64+HG Mountain View, CA, United States",
            "global_code": "849VCW64+HG"
          },
          "rating": 2.8,
          "reference": "ChIJs-JGWqiwj4ARSCUZWmywZ_Q",
          "scope": "GOOGLE",
          "types": [
            "atm",
            "bank",
            "finance",
            "point_of_interest",
            "establishment"
          ],
          "user_ratings_total": 20,
          "vicinity": "580 North Rengstorff Avenue, Mountain View"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4140228, "lng": -122.0895644},
            "viewport": {
              "northeast": {
                "lat": 37.41552858029149,
                "lng": -122.0882018197085
              },
              "southwest": {"lat": 37.41283061970849, "lng": -122.0908997802915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/bank_dollar-71.png",
          "id": "480e64b5fc61f938d3358ec8d99dd11049d38b06",
          "name": "ATM 7ELEVEN, INC.",
          "photos": [
            {
              "height": 4032,
              "html_attributions": [
                "\u003ca href=\"https://maps.google.com/maps/contrib/107107564518257413414\"\u003eSergio Odintsov\u003c/a\u003e"
              ],
              "photo_reference":
                  "CmRaAAAAU8WPHSOtAweYxOp4dEFUPzD3hOC8EwIL4jS6ht7Cu8NxZXh1gxwKglJoNI-2gNC3w-mKUzahV8bjweFKTP0bm8s_23qUzlLDGckY8wCWqE_kg9IsbdsmnmoU3dh4B0JdEhB5ACqF_dj4UoTtgpyLS9mMGhQUBZFAr86h7BiBiw6DVjr0uj-2kQ",
              "width": 3024
            }
          ],
          "place_id": "ChIJtzIITQe6j4ARxbt2TyJWk0E",
          "plus_code": {
            "compound_code": "CW76+J5 Mountain View, CA, United States",
            "global_code": "849VCW76+J5"
          },
          "reference": "ChIJtzIITQe6j4ARxbt2TyJWk0E",
          "scope": "GOOGLE",
          "types": [
            "bank",
            "atm",
            "finance",
            "point_of_interest",
            "establishment"
          ],
          "vicinity": "1951 Old Middlefield Way, Mountain View"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4209562, "lng": -122.0957535},
            "viewport": {
              "northeast": {
                "lat": 37.42223578029149,
                "lng": -122.0939737697085
              },
              "southwest": {"lat": 37.41953781970849, "lng": -122.0966717302915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/atm-71.png",
          "id": "4f081f5ecdfa193e8428a3c85961015ef4076f11",
          "name": "Citibank ATM",
          "opening_hours": {"open_now": false},
          "place_id": "ChIJx247-w-6j4ARHpL7DvRIZBA",
          "plus_code": {
            "compound_code": "CWC3+9M Mountain View, CA, United States",
            "global_code": "849VCWC3+9M"
          },
          "reference": "ChIJx247-w-6j4ARHpL7DvRIZBA",
          "scope": "GOOGLE",
          "types": ["atm", "finance", "point_of_interest", "establishment"],
          "vicinity": "1000 North Rengstorff Avenue, Mountain View"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.428434, "lng": -122.0723816},
            "viewport": {
              "northeast": {"lat": 37.4297184802915, "lng": -122.0710258697085},
              "southwest": {"lat": 37.4270205197085, "lng": -122.0737238302915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
          "id": "5b41e7789626ebedbcc9c33270718660754e505e",
          "name": "Dfco",
          "place_id": "ChIJAQAAAPC5j4AR2GRGjdTxBfc",
          "reference": "ChIJAQAAAPC5j4AR2GRGjdTxBfc",
          "scope": "GOOGLE",
          "types": ["atm", "finance", "point_of_interest", "establishment"],
          "vicinity": "Mountain View"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4112994, "lng": -122.0932645},
            "viewport": {
              "northeast": {"lat": 37.4126699302915, "lng": -122.0918712197085},
              "southwest": {"lat": 37.4099719697085, "lng": -122.0945691802915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/atm-71.png",
          "id": "f92051af49ddc11058821437aa9afc8080ea1591",
          "name": "ATM",
          "place_id": "ChIJmWDTR6iwj4AR3yDf6YqxUYE",
          "plus_code": {
            "compound_code": "CW64+GM Mountain View, CA, United States",
            "global_code": "849VCW64+GM"
          },
          "rating": 4.5,
          "reference": "ChIJmWDTR6iwj4AR3yDf6YqxUYE",
          "scope": "GOOGLE",
          "types": ["atm", "finance", "point_of_interest", "establishment"],
          "user_ratings_total": 2,
          "vicinity": "584 North Rengstorff Avenue, Mountain View"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4113008, "lng": -122.0932684},
            "viewport": {
              "northeast": {"lat": 37.4126718302915, "lng": -122.0918740697085},
              "southwest": {"lat": 37.4099738697085, "lng": -122.0945720302915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/atm-71.png",
          "id": "719d8f6c4c9e2b0c3113564484d36b0e064aff62",
          "name": "Coin Cloud Bitcoin ATM",
          "opening_hours": {"open_now": true},
          "place_id": "ChIJ4_NkvlCxj4ARFkoBIVR8cY0",
          "plus_code": {
            "compound_code": "CW64+GM Mountain View, CA, United States",
            "global_code": "849VCW64+GM"
          },
          "reference": "ChIJ4_NkvlCxj4ARFkoBIVR8cY0",
          "scope": "GOOGLE",
          "types": ["atm", "finance", "point_of_interest", "establishment"],
          "vicinity": "584 North Rengstorff Avenue, Mountain View"
        }
      ],
      "status": "OK"
    };
    // final response =
    //     await getResponse(location: location, radius: radius, type: type);
    // final responseJson = jsonDecode(response);
    // return Place.fromJson(responseJson, type);
    return Place.fromJson(newResponse, type);
  }

  Future<String> getResponse({
    @required LatLng location,
    @required int radius,
    @required String type,
  }) async {
    ApiKey k = ApiKey();
    final String apiKey = k.getKey;

    final placesUrl =
        '$baseUrl/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=$radius&type=$type&key=$apiKey';
    print(placesUrl);
    http.Response placesResponse;
    try {
      placesResponse = await this.httpClient.get(placesUrl);
    } catch (error) {
      print('$error error occured');
    }
    if (placesResponse.statusCode != 200) {
      print('Error in receiving response!');
      throw Exception('error getting response for location');
    }
    return placesResponse.body;
  }
}
