import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:voting_app/constants/party_image_url.dart';
import 'package:voting_app/gen/assets.gen.dart';
import 'package:voting_app/models/enums/election_category.dart';

class ViewCandidateTile extends StatelessWidget {
  const ViewCandidateTile({
    super.key,
    required this.candidateName,
    required this.candidateParty,
    required this.candidateImgUrl,
    required this.candidateDescription,
    required this.electioncategory,
    required this.partyAcronym,
  });
  final String candidateName;
  final String candidateParty;
  final String candidateImgUrl;
  final String candidateDescription;
  final ELECTIONCATEGORY electioncategory;
  final String partyAcronym;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: candidateImgUrl,
                height: 230,
                width: double.infinity,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 200,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 47,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                    child: Text(
                      candidateName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: CachedNetworkImage(
                    imageUrl: PartyImageLogo.getPartyImageUrl(
                        partyAcronym: partyAcronym),
                    height: 44,
                    width: 46,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Short Biography',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        candidateDescription,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )

          // Green info box
          /* Container(
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
                        "https://source.unsplash.com/200x200/?portrait,John Doe",
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              candidateName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        candidateParty.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
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

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: PartyImageLogo.getPartyImageUrl(
                        partyAcronym: partyAcronym),
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
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
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorList.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  candidateDescription,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          )*/
        ],
      ),
    );
  }
}
