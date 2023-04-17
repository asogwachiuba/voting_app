import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:voting_app/constants/party_image_url.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/models/enums/election_category.dart';

class ViewResultTile extends StatelessWidget {
  const ViewResultTile({
    super.key,
    required this.party,
    required this.votes,
    required this.hasHighestVote,
    required this.totalElectionVote,
    required this.electioncategory,
  });
  final String party;
  final String votes;
  final int totalElectionVote;
  final bool hasHighestVote;
  final ELECTIONCATEGORY electioncategory;

  @override
  Widget build(BuildContext context) {
    int vote = int.tryParse(votes) ?? 0;
    double votePercentage = vote / totalElectionVote;
    Color getVoteStatusColor() {
      if (totalElectionVote == 0) {
        return Colors.black;
      }
      if (votePercentage <= 0.2) {
        return Colors.black;
      } else if (votePercentage <= 0.4) {
        return Colors.red;
      } else if (votePercentage <= 0.6) {
        return Colors.yellow;
      } else {
        return ColorList.primaryColor;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 10,
        child: Column(
          children: [
            // Green info box
            Container(
              decoration: BoxDecoration(
                color: ColorList.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl:
                          PartyImageLogo.getPartyImageUrl(partyAcronym: party),
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),

                  // Candidate info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${party.toUpperCase()} Party',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${electioncategory.name.toUpperCase()} Candidate',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (hasHighestVote && totalElectionVote != 0)
                    Assets.goldBadge.image(
                      height: 50,
                    ),
                ],
              ),
            ),

            // White result box from here downward
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$votes Votes",
                      style: TextStyle(
                        color: getVoteStatusColor(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: LinearProgressIndicator(
                      color: getVoteStatusColor(),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      value: totalElectionVote == 0
                          ? 0
                          : (vote / totalElectionVote),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("0-20%")
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("21-40%")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("40-60%")
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("60-80%")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("80-100%")
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
