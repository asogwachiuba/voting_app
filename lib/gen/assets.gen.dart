/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsModelGen {
  const $AssetsModelGen();

  /// File path: assets/model/mobilefacenet.tflite
  String get mobilefacenet => 'assets/model/mobilefacenet.tflite';

  /// List of all assets
  List<String> get values => [mobilefacenet];
}

class Assets {
  Assets._();

  static const AssetGenImage appIcon = AssetGenImage('assets/appIcon.jpeg');
  static const AssetGenImage backArrow = AssetGenImage('assets/back_arrow.png');
  static const SvgGenImage check = SvgGenImage('assets/check.svg');
  static const AssetGenImage goldBadge = AssetGenImage('assets/gold_badge.png');
  static const SvgGenImage icAccountVerification =
      SvgGenImage('assets/ic_account_verification.svg');
  static const SvgGenImage icBack = SvgGenImage('assets/ic_back.svg');
  static const SvgGenImage icCamera = SvgGenImage('assets/ic_camera.svg');
  static const SvgGenImage icCandidates =
      SvgGenImage('assets/ic_candidates.svg');
  static const SvgGenImage icCorrect = SvgGenImage('assets/ic_correct.svg');
  static const SvgGenImage icElectionType =
      SvgGenImage('assets/ic_election_type.svg');
  static const AssetGenImage icEmail = AssetGenImage('assets/ic_email.png');
  static const AssetGenImage icFaceJpeg = AssetGenImage('assets/ic_face.jpeg');
  static const SvgGenImage icFaceSvg = SvgGenImage('assets/ic_face.svg');
  static const SvgGenImage icFingerprint =
      SvgGenImage('assets/ic_fingerprint.svg');
  static const SvgGenImage icGood = SvgGenImage('assets/ic_good.svg');
  static const SvgGenImage icInfo = SvgGenImage('assets/ic_info.svg');
  static const SvgGenImage icLock = SvgGenImage('assets/ic_lock.svg');
  static const SvgGenImage icProfile = SvgGenImage('assets/ic_profile.svg');
  static const SvgGenImage icResults = SvgGenImage('assets/ic_results.svg');
  static const AssetGenImage icSecutiry =
      AssetGenImage('assets/ic_secutiry.png');
  static const SvgGenImage icSteps = SvgGenImage('assets/ic_steps.svg');
  static const SvgGenImage icVotingPoll =
      SvgGenImage('assets/ic_voting_poll.svg');
  static const $AssetsModelGen model = $AssetsModelGen();
  static const AssetGenImage onboarding1 =
      AssetGenImage('assets/onboarding1.png');
  static const AssetGenImage onboarding2 =
      AssetGenImage('assets/onboarding2.png');
  static const AssetGenImage onboarding3 =
      AssetGenImage('assets/onboarding3.png');
  static const SvgGenImage stepFour = SvgGenImage('assets/step_four.svg');
  static const SvgGenImage stepOne = SvgGenImage('assets/step_one.svg');
  static const SvgGenImage stepThree = SvgGenImage('assets/step_three.svg');
  static const SvgGenImage stepTwo = SvgGenImage('assets/step_two.svg');

  /// List of all assets
  List<dynamic> get values => [
        appIcon,
        backArrow,
        check,
        goldBadge,
        icAccountVerification,
        icBack,
        icCamera,
        icCandidates,
        icCorrect,
        icElectionType,
        icEmail,
        icFaceJpeg,
        icFaceSvg,
        icFingerprint,
        icGood,
        icInfo,
        icLock,
        icProfile,
        icResults,
        icSecutiry,
        icSteps,
        icVotingPoll,
        onboarding1,
        onboarding2,
        onboarding3,
        stepFour,
        stepOne,
        stepThree,
        stepTwo
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
