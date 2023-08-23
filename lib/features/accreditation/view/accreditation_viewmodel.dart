import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voting_app/core/app/app.locator.dart';
import 'package:voting_app/core/app_utils.dart';
import 'package:voting_app/core/voting_app_viewmodel.dart';
import 'package:voting_app/features/accreditation/service/aws_service.dart';
import 'package:voting_app/features/election_options/view/election_options_view.dart';
import 'package:voting_app/util/notification.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as imglib;

class AccreditationViewModel extends VotingAppViewmodel {
  /// States and variables =====================================================

  final awsService = locator<AwsService>();
  final localAuthentication = LocalAuthentication();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool newValue) {
    _isAuthenticated = newValue;
    notifyListeners();
  }

  int _currentStep = 0;

  int get currentStep => _currentStep;

  set currentStep(int newValue) {
    _currentStep = newValue;
    notifyListeners();
  }

  bool _ninIsVerified = false;

  bool get ninIsVerified => _ninIsVerified;

  set ninIsVerified(bool newValue) {
    _ninIsVerified = newValue;
    notifyListeners();
  }

  bool _isAmputee = false;

  bool get isAmputee => _isAmputee;

  set isAmputee(bool newValue) {
    _isAmputee = newValue;
    notifyListeners();
  }

  bool _hasFaceId = false;

  bool get hasFaceId => _hasFaceId;

  set hasFaceId(bool newValue) {
    _hasFaceId = newValue;
    notifyListeners();
  }

  File? _imageFile;

  File? get imageFile => _imageFile;

  set imageFile(File? newValue) {
    _imageFile = newValue;
    notifyListeners();
  }

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );

  XFile? cameraImage; // Image captured from the camera
  String? firebaseImageURL;
  Uint8List? firebaseImage;
  double similarityThreshold = 0.7;

  /// Methods ==================================================================

  onReady() {
    final user = db.getCurrentUser();
    isAmputee = user?.isAmputee ?? false;
    firebaseImageURL = user?.profileImageUrl;
    getImageFromFirebase();
  }

  Future<void> getImageFromFirebase() async {
    // Download the stored image from Firebase Storage
    final ref = FirebaseStorage.instance.refFromURL(firebaseImageURL!);

    final byteData = await ref.getData();

    if (byteData == null) {
      // Handle error with byte conversion
      logger.e("Error converting firebase image");
      // AppNotification.error(
      //     error: "An error occurred while analyzing your photo");
      return;
    }

    firebaseImage = byteData;
  }

  // authenticate() async {
  //   if (isAuthenticated) {
  //     return; // User is already authenticated, so no need to authenticate again
  //   }
  //   isFaceIdAvailable();
  //
  //   // Uses face ID if available
  //   if (hasFaceId) {
  //     faceAuthentication();
  //     return;
  //   }
  //   try {
  //     isAuthenticated = await localAuthentication.authenticate(
  //       localizedReason: isAmputee
  //           ? 'Provide your device password for election validation'
  //           : 'Provide your fingerprint for election validation',
  //       options: AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: !isAmputee,
  //       ),
  //     );
  //   } on PlatformException catch (e) {
  //     logger.d('Error: $e');
  //   }
  // }

  // faceAuthentication() async {
  //   if (isAuthenticated) return;
  //   try {
  //     isAuthenticated = await localAuthentication.authenticate(
  //       localizedReason: 'Please validate with your face',
  //       options: const AuthenticationOptions(
  //         useErrorDialogs: false,
  //         biometricOnly: true,
  //       ),
  //     );
  //   } on PlatformException catch (e) {
  //     if (e.code == auth_error.notAvailable) {
  //       AppNotification.error(
  //           error:
  //               "Your device does not support face verification. Please use another device");
  //     } else if (e.code == auth_error.notEnrolled) {
  //       AppNotification.error(
  //           error:
  //               "Setup your face verification in your device to enable you register.");
  //     } else {
  //       AppNotification.error(error: "Authentication failed, try again.");
  //     }
  //   }
  // }

  // isFaceIdAvailable() async {
  //   final List<BiometricType> availableBiometrics =
  //       await localAuthentication.getAvailableBiometrics();
  //
  //   logger.d(availableBiometrics.toString());
  //
  //   if (availableBiometrics.contains(BiometricType.face)) {
  //     hasFaceId = true;
  //     logger.d(availableBiometrics.toString());
  //     return;
  //   }
  //
  //   // AppNotification.error(error: 'No Face ID setup');
  // }

  validateNIN({required String nin}) async {
    if (nin.length == 11 && !ninIsVerified) {
      ninIsVerified = (nin == db.getCurrentUser()?.nin);
      if (!ninIsVerified) {
        AppNotification.error(error: "Incorrect NIN, try again");
      }
    }
  }

  toElectionOptions() {
    navigationService.navigateToView(const ElectionOptionsView());
  }

  back() {
    navigationService.back();
  }

  toNextStep() {
    currentStep++;
  }

  takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      cameraImage = pickedFile;
      _imageFile = File(pickedFile.path);
      notifyListeners();

      if (_imageFile != null) {
        _compareFacesViaAWS();
      }
    }
  }

  final String processingImage = "ProcessingImage....";

  Future<void> _processImage(File imageFile) async {
    setBusyForObject(processingImage, true);

    //Get inputImage for ML
    final inputImage = InputImage.fromFilePath(imageFile.path);

    final faces = await _faceDetector.processImage(inputImage);
    if (faces.isNotEmpty) {
      AppNotification.notify(notificationMessage: "Face Verified!");
      isAuthenticated = true;
    } else {
      logger.d(faces.length);
      AppNotification.notify(notificationMessage: "Verification failed");
    }

    setBusyForObject(processingImage, false);
  }

  Future<void> _compareFacesViaAWS() async {
    setBusyForObject(processingImage, true);

    // final sourceFile = File(firebaseImage?.path ?? "");
    final targetFile = _imageFile;

    logger.d("FirebaseImageBytes: $firebaseImage");

    final result = await awsService.compareFaces(
        sourceFile: firebaseImage!, targetFile: targetFile!);

    if (result != null && result.totalFacesFoundInTargetImage > 1) {
      AppNotification.notify(
          notificationMessage: "Multiple faces detected, try again");
    } else if (result != null && result.matchResult) {
      AppNotification.notify(notificationMessage: "Face Verified!");
      isAuthenticated = true;
    } else {
      AppNotification.notify(notificationMessage: "Verification failed");
    }

    setBusyForObject(processingImage, false);
  }

  // Future<Face?> _detectFace(File imageFile) async {
  //   final inputImage = InputImage.fromFilePath(imageFile.path);
  //
  //   final List<Face> faces = await _faceDetector.processImage(inputImage);
  //
  //   if (faces.isNotEmpty) {
  //     return faces.first;
  //   } else {
  //     return null;
  //   }
  // }

  // Helper function to convert an image to a Float32List
  Float32List imageToFloat32List(imglib.Image image) {
    var convertedBytes = Float32List(1 * image.width * image.height * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (int i = 0; i < image.height; i++) {
      for (int j = 0; j < image.width; j++) {
        int pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (imglib.getRed(pixel)) / 255.0;
        buffer[pixelIndex++] = (imglib.getGreen(pixel)) / 255.0;
        buffer[pixelIndex++] = (imglib.getBlue(pixel)) / 255.0;
      }
    }
    return convertedBytes;
  }

  double _euclideanDistance(List<double> a, List<double> b) {
    double sum = 0.0;
    for (int i = 0; i < a.length; i++) {
      double diff = a[i] - b[i];
      sum += diff * diff;
    }
    return sqrt(sum);
  }

  // Future<void> compareFaces() async {
  //   if (cameraImage == null || firebaseImage == null || interpreter == null) {
  //     // Handle missing data
  //     return;
  //   }
  //
  //   // Load and preprocess the camera image
  //   final cameraImageData = await cameraImage!.readAsBytes();
  //   final cameraEmbedding = await getFaceEmbedding(cameraImageData);
  //
  //   // Load and preprocess the Firebase image
  //   final firebaseImageData = await firebaseImage!.readAsBytes();
  //   final firebaseEmbedding = await getFaceEmbedding(firebaseImageData);
  //
  //   if (cameraEmbedding == null || firebaseEmbedding == null) {
  //     // Handle face detection or embedding extraction errors
  //     return;
  //   }
  //
  //   // Calculate the cosine similarity between the embeddings
  //   final similarity = calculateCosineSimilarity(cameraEmbedding, firebaseEmbedding);
  //
  //   if (similarity >= similarityThreshold) {
  //     // Faces are similar
  //     print("Faces are similar with similarity score: $similarity");
  //   } else {
  //     // Faces are not similar
  //     print("Faces are not similar with similarity score: $similarity");
  //   }
  // }

  Float32List imageToByteListFloat32(imglib.Image image) {
    /// input size = 112
    var convertedBytes = Float32List(1 * 112 * 112 * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < 112; i++) {
      for (var j = 0; j < 112; j++) {
        var pixel = image.getPixel(j, i);

        /// mean: 128
        /// std: 128
        buffer[pixelIndex++] = (imglib.getRed(pixel) - 128) / 128;
        buffer[pixelIndex++] = (imglib.getGreen(pixel) - 128) / 128;
        buffer[pixelIndex++] = (imglib.getBlue(pixel) - 128) / 128;
      }
    }
    return convertedBytes.buffer.asFloat32List();
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }
}
