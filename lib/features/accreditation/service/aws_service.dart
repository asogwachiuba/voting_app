import 'dart:io';
import 'dart:typed_data';
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/features/accreditation/model/aws_verify_model.dart';

class AwsService {
  String accessKey = "AKIA3NN66ZUGVZ7OXGH2";
  String secretKey = "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";
  String region = "us-east-1";

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
