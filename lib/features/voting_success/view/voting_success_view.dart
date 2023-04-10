import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voting_app/constants/color_list.dart';
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

class _VotingSuccessViewState extends State<VotingSuccessView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          return true;
        },
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller!,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [
                        ColorList.darkGreen,
                        ColorList.lightGreen,
                        ColorList.darkGreen,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0.0,
                        0.5,
                        1.0,
                      ],
                      tileMode: TileMode.mirror,
                      transform:
                          GradientRotation(_controller!.value * 2 * 3.14),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Congratulations \n          ${widget.user.fullName}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      height: 200,
                      width: 200,
                      imageUrl: widget.selectedCandidateImgUrl,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.selectedCandidateName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.selectedCandidateParty,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Vote Placed Successfully",
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                          child: AppButton(
                              onPressed_: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              buttonName: "Continue")),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
