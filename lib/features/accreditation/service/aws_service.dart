import 'dart:io';
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:voting_app/features/accreditation/model/aws_verify_model.dart';

class AwsService {
  String accessKey = "Your_access_key’";
  String secretKey = "Your_Secret_key";
  String region = "Your Region";

  Future<AWSVerifyModel> compareFaces(
      {required File sourceFile, required File targetFile}) async {
    final rekognition = Rekognition(
        region: region,
        credentials:
            AwsClientCredentials(accessKey: accessKey, secretKey: secretKey));

    final sourceFileBytes = await sourceFile.readAsBytes();
    final targetFileBytes = await targetFile.readAsBytes();

    final result = await rekognition.compareFaces(
        sourceImage: Image(bytes: sourceFileBytes),
        targetImage: Image(bytes: targetFileBytes));

    AWSVerifyModel model = AWSVerifyModel(response: result);
    return model;
  }
}
