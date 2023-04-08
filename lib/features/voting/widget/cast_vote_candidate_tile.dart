import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CastVoteCandidateTile extends StatelessWidget {
  const CastVoteCandidateTile({
    super.key,
    required this.candidateName,
    required this.candidateParty,
    required this.candidateImgUrl,
    required this.onVote,
  });
  final String candidateName;
  final String candidateParty;
  final String candidateImgUrl;
  final Function(
    String,
    String,
    String,
  ) onVote;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CachedNetworkImage(
          height: 60,
          width: 60,
          imageUrl: candidateImgUrl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        title: Text(candidateName),
        subtitle: Text(candidateParty),
        trailing: Card(
          color: Colors.white,
          elevation: 15,
          child: IconButton(
            icon: const Icon(
              Icons.how_to_vote,
              color: ColorList.primaryColor,
              size: 35,
            ),
            onPressed: () {
              onVote(
                candidateName,
                candidateImgUrl,
                candidateParty,
              );
            },
          ),
        ));
  }
}
