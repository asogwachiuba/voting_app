import 'package:flutter/material.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/models/user/votingapp_user.dart';
import 'package:voting_app/widgets/app_button.dart';

class VotingSuccessView extends StatefulWidget {
  const VotingSuccessView({
    super.key,
    required this.selectedCandidateImgUrl,
    required this.selectedCandidateName,
    required this.selectedCandidateParty,
    required this.user,
  });

  final String selectedCandidateImgUrl;
  final String selectedCandidateName;
  final String selectedCandidateParty;
  final VotingappUser user;

  @override
  _VotingSuccessViewState createState() => _VotingSuccessViewState();
}

class _VotingSuccessViewState extends State<VotingSuccessView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            Navigator.pop(context);
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back button and title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Assets.icBack
                              .svg(height: 15, width: 17, fit: BoxFit.fill)),
                      const Spacer(),
                      const Text(
                        'Voting Successful',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 7,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Assets.icCorrect.svg(
                    height: 112,
                    width: 112,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 35.0),
                const Text(
                  "Your vote has been recorded ",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: AppButton(
                    height: 45,
                    // Navigates back to home oage
                    onPressed_: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    buttonName: "Continue",
                    borderRadius: 10,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
