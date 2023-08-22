import 'dart:io';
import 'dart:typed_data';
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/features/accreditation/model/aws_verify_model.dart';

class AwsService {
  String accessKey = dotenv.get("AWS_ACCESS_KEY");
  String secretKey = dotenv.get("AWS_SECRET_KEY");
  String region = dotenv.get("AWS_REGION");

  Future<AWSVerifyModel?> compareFaces(
      {required Uint8List sourceFile, required File targetFile}) async {
    try {
      final rekognition = Rekognition(
          region: region,
          credentials:
              AwsClientCredentials(accessKey: accessKey, secretKey: secretKey));

      final sourceFileBytes = sourceFile;
      final targetFileBytes = await targetFile.readAsBytes();

      final result = await rekognition.compareFaces(
          sourceImage: Image(bytes: sourceFileBytes),
          targetImage: Image(bytes: targetFileBytes));

      AWSVerifyModel model = AWSVerifyModel(response: result);
      return model;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
