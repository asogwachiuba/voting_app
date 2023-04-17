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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
              )),
          child: Row(
            children: [
              CachedNetworkImage(
                height: 100,
                width: 80,
                imageUrl:
                    PartyImageLogo.getPartyImageUrl(partyAcronym: partyAcronym),
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        candidateName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        candidateParty,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: ColorList.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: ColorList.primaryColor,
                elevation: 15,
                child: IconButton(
                  icon: const Icon(
                    Icons.how_to_vote,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    onVote(
                      candidateName,
                      candidateImgUrl,
                      partyAcronym,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListTile(
// leading: CachedNetworkImage(
//   height: 90,
//   width: 70,
//   imageUrl: candidateImgUrl,
//   fit: BoxFit.fill,
//   errorWidget: (context, url, error) => const Icon(
//     Icons.person,
//     color: Colors.black,
//   ),
// ),
//           title: Text(candidateName),
//           subtitle: Text(candidateParty),
//           trailing: Card(
//             color: Colors.white,
//             elevation: 15,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.how_to_vote,
//                 color: ColorList.primaryColor,
//                 size: 35,
//               ),
//               onPressed: () {
//                 onVote(
//                   candidateName,
//                   candidateImgUrl,
//                   partyAcronym,
//                 );
//               },
//             ),
//           ))
