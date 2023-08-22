import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:voting_app/constants/party_image_url.dart';

class CastVoteCandidateTile extends StatelessWidget {
  const CastVoteCandidateTile({
    super.key,
    required this.candidateName,
    required this.candidateParty,
    required this.candidateImgUrl,
    required this.onVote,
    required this.partyAcronym,
  });
  final String candidateName;
  final String candidateParty;
  final String candidateImgUrl;
  final String partyAcronym;
  final Function(
    String,
    String,
    String,
  ) onVote;

  @override
  Widget build(BuildContext context) {
    Future<void> showVoteDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'You selected $candidateParty',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Vote for $candidateName in this Election',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes, please'),
                onPressed: () {
                  onVote(
                    candidateName,
                    candidateImgUrl,
                    partyAcronym,
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return InkWell(
      onTap: () {
        showVoteDialog();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 15,
                right: 30,
                top: 8,
                bottom: 8,
              ),
              decoration: const BoxDecoration(
                color: Color(0XFFF5F5F5),
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  CachedNetworkImage(
                    height: 50,
                    width: 50,
                    imageUrl: PartyImageLogo.getPartyImageUrl(
                        partyAcronym: partyAcronym),
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      candidateName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  )
                ],
              ),
            ),
            Positioned(
                top: -15,
                right: 15,
                child: Text(
                  candidateParty,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
