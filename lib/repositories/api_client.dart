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
    ApiKey k = ApiKey();
    final String apiKey = k.getKey;

    final placesUrl =
        '$baseUrl/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=$radius&type=$type&key=$apiKey';
    print(placesUrl);
    // final placesResponse = await this.httpClient.get(placesUrl);
    // if (placesResponse.statusCode != 200) {
    //   print('Error in receiving response!');
    //   throw Exception('error getting response for location');
    // }
    final placesResponse = {
      "html_attributions": [],
      "next_page_token":
          "CqQCGAEAAHfz5PLukMlIaJAt-HgsA6slRIqznYV_wkp571K9vkQy1vUKgLUwSCWS-oY6Ba0WyqHD0i1-7NiAxMyO5si3DiZKKeiTAtmsaBv-obPmIMY-V3sBri3DIxbN5oFonuyqTFUFzkzjuOvfpv3ZSjgPpHxe1DruO7llqrHoeq92iz-TRu-ARU5XyZvuMcm7_qQbAbQF6KTyTujx-QtqI7CgvMk7pG74fQyPXfLdXREZp1sZuHf4NcDSciraSb2iU9WqJdm7TyiWWL0PCGziMpy5_NkrSF5wO_u7S7uhBa_jiNHNc5hyH2ak3Pow3dTrjm-6IGm-_zQhMN4cBj4KvdijEvDb3dkb36gD3aRTNNiJ2bKv1G2pKZtV-0OHB_au_mOlvBIQOvqAYcUY6hhSv_5BpGx75xoU_sUC5gbGaXWOe1mRdVAsCrMyX7o",
      "results": [
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.4029371, "lng": -122.0790568},
            "viewport": {
              "northeast": {
                "lat": 37.40427588029149,
                "lng": -122.0776461697085
              },
              "southwest": {"lat": 37.40157791970849, "lng": -122.0803441302915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/atm-71.png",
          "id": "4d1edce69b3835d5274453de7402554196bbc40a",
          "name": "Wells Fargo ATM",
          "opening_hours": {"open_now": true},
          "photos": [
            {
              "height": 608,
              "html_attributions": [
                "\u003ca href=\"https://maps.google.com/maps/contrib/106338561779289784852\"\u003eWells Fargo ATM\u003c/a\u003e"
              ],
              "photo_reference":
                  "CmRaAAAAC6Wo0KEQ-7_CMCheSEcwEJeBuDNI_B_vqEVi_vlnFszSKAgToht0HNapRWnjhSYeOUGdzar972rax1rPqGJcZuNJXBBXJlnVlnRFo8kohAlT5YwKs81i7X6YQOvbZtRaEhCksoDlUKTIElLAN_MUiMhSGhRm2R7riQ_fXsIkLDsT6Wzx7ypUBg",
              "width": 1080
            }
          ],
          "place_id": "ChIJ1Yam3EClj4ARsvTBeGUJiFs",
          "plus_code": {
            "compound_code": "CW3C+59 Mountain View, CA, United States",
            "global_code": "849VCW3C+59"
          },
          "rating": 2.6,
          "reference": "ChIJ1Yam3EClj4ARsvTBeGUJiFs",
          "scope": "GOOGLE",
          "types": ["atm", "finance", "point_of_interest", "establishment"],
          "user_ratings_total": 5,
          "vicinity": "570 North Shoreline Boulevard, Mountain View"
        },
        {
          "business_status": "OPERATIONAL",
          "geometry": {
            "location": {"lat": 37.3886419, "lng": -122.0825577},
            "viewport": {
              "northeast": {
                "lat": 37.39017208029149,
                "lng": -122.0812162697085
              },
              "southwest": {"lat": 37.3874741197085, "lng": -122.0839142302915}
            }
          },
          "icon":
              "https://maps.gstatic.com/mapfiles/place_api/icons/bank_dollar-71.png",
          "id": "df23c5086663750b8f50a56f891c005595b1f8a3",
          "name": "Wells Fargo Bank",
          "opening_hours": {"open_now": false},
          "photos": [
            {
              "height": 3036,
              "html_attributions": [
                "\u003ca href=\"https://maps.google.com/maps/contrib/115075519612791906354\"\u003eDouglas MacKallor\u003c/a\u003e"
              ],
              "photo_reference":
                  "CmRaAAAAKCNxmLJtMI6Yei8EvhMkomk236uE_oEUdMpZqwob1rEq_Ce5FGbw0OzglzHAncN6P8_WY0PiP4WzVbjipiW9Rw7YaP6B_6MBbIgAOi0VTsFDqxS56Z3lHQyxxcS4-B6fEhA5dt6FL3-L7k1Uz2Sb0Mv-GhRSakRFLYu9Q6USffJj0dXNql8cEg",
              "width": 4048
            }
          ],
          "place_id": "ChIJ41SJwTK3j4ARUFHxoqibyoY",
          "plus_code": {
            "compound_code": "9WQ8+FX Mountain View, CA, United States",
            "global_code": "849V9WQ8+FX"
          },
          "rating": 4.2,
          "reference": "ChIJ41SJwTK3j4ARUFHxoqibyoY",
          "scope": "GOOGLE",
          "types": [
            "bank",
            "atm",
            "finance",
            "point_of_interest",
            "establishment"
          ],
          "user_ratings_total": 57,
          "vicinity": "599 Castro Street Ste 150, Mountain View"
        },
      ],
      "status": "OK"
    };
    // print(placesResponse.body);
    // final responseJson = jsonDecode(placesResponse);
    // print('$responseJson');
    // return Place.fromJson(responseJson, type);
    return Place.fromJson(placesResponse, type);
  }
}
