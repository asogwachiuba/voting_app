import 'package:voting_app/core/voting_app_viewmodel.dart';

class ElectionInfoViewmodel extends VotingAppViewmodel {
  List<Map<String, String>> electionInfo = [
    {
      "title": "Method of Voting",
      "content":
          "Voting shall be in accordance with the Continuous Accreditation and"
              "Voting System (CAVS) procedures as specified in these"
              "Regulations and Guidelines, the Election Manual and any other"
              "Guide issued by the Commission.",
    },
    {
      "title": "Voting at Appropriate Polling Units",
      "content":
          "No person shall be allowed to vote at any Polling Unit/Voting Point other than the one at which his/her name"
              "appears in the Register of Voters and he/she presents his/her"
              "details in accordance with was registered to be verified.",
    },
    {
      "title": "Opening of poll",
      "content":
          "Voting begins by 9 am daily during election period. Ensure your devices are fully charged and network "
              " is a available before then.",
    },
  ];

  back() {
    navigationService.back();
  }
}
