import 'package:voting_app/constants/keys.dart';

class PartyImageLogo {
  /// Returns image url of party images saved to google firebase storage
  static String getPartyImageUrl({required String partyAcronym}) {
    switch (partyAcronym) {
      case Keys.a:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FA.jpeg?alt=media&token=e40a0caf-9e09-4d93-9720-02330a1a288c";
      case Keys.aa:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAA.jpeg?alt=media&token=1647203c-fd14-4dfa-b8fa-564970824498";
      case Keys.aac:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAAC.png?alt=media&token=ae93bcaa-eadd-413b-ab51-bfe9b4113cf7";
      case Keys.adc:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FADC.png?alt=media&token=f451de8b-fbb1-495a-ba0f-dc825f3d9424";
      case Keys.adp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAD.jpg?alt=media&token=8b04cdbf-678e-4e05-bcd2-1d6586db4c01";
      case Keys.apc:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAPC.jpeg?alt=media&token=751cc146-8312-4b63-a8fa-8cdfcc84eb25";
      case Keys.apga:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAPGA.png?alt=media&token=06798780-0ae7-4d4b-ab57-7e5ba864edae";
      case Keys.apm:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAPM.jpeg?alt=media&token=e042b2f8-c132-4fe9-ac43-1da7c9293ebf";
      case Keys.app:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FAPP.jpeg?alt=media&token=5eeed472-ae6b-4fc6-85c1-5154a4ea7e41";
      case Keys.bp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FBP.jpeg?alt=media&token=f3ddfa9a-d6fc-44fb-830e-b4f940966dd8";
      case Keys.lp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FLP.png?alt=media&token=8e1e85a5-790b-4bd0-a825-13072b11c40b";
      case Keys.nnpp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FNNPP.jpeg?alt=media&token=0d715392-a3cf-4ca2-af68-d0c6ec6c1c96";
      case Keys.nrm:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FNRM.png?alt=media&token=313f88c3-259f-4d26-8edc-60dbf178f4e3";
      case Keys.pdp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FPDP.png?alt=media&token=59376916-8977-495b-97a0-0c6f478249eb";
      case Keys.prp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FPRP.jpeg?alt=media&token=93f86e9e-5783-4fa2-898b-fc09eb610c63";
      case Keys.sdp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FSDP.png?alt=media&token=f99c034a-fcbb-43a4-ab12-f02a127ee874";
      case Keys.ypp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FYPP.png?alt=media&token=e7e5efa8-93fd-4aba-bb10-d98c7bbb9dbf";
      case Keys.zlp:
        return "https://firebasestorage.googleapis.com/v0/b/votingapp-47997.appspot.com/o/Party%20Image%2FZLP.jpeg?alt=media&token=447616ba-700c-47ba-bb1d-8010266be1f9";
      default:
        return "";
    }
  }
}
