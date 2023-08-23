import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:voting_app/core/app_utils.dart';

class AWSVerifyModel {
  bool matchResult = false;
  String? confidence;
  int totalFacesFoundInTargetImage = 0;
  String? message;

  AWSVerifyModel({required CompareFacesResponse response}) {
    final matchedFaces = response.faceMatches ?? [];
    final unmatchedFaces = response.unmatchedFaces ?? [];
    totalFacesFoundInTargetImage = matchedFaces.length + unmatchedFaces.length;

    logger.d("Total Faces $totalFacesFoundInTargetImage");

    if (matchedFaces.isNotEmpty) {
      message = "Verified";
      matchResult = true;
      confidence = matchedFaces.first.similarity?.toStringAsFixed(2);
      logger.d("Confidence level: $confidence");
    } else {
      message = "Failed: No matched face found.";
      logger.d(message);
    }
  }
}
