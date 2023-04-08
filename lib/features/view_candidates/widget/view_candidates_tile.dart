import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewCandidateTile extends StatelessWidget {
  const ViewCandidateTile({
    super.key,
    required this.candidateName,
    required this.candidateParty,
    required this.candidateImgUrl,
    required this.candidateDescription,
  });
  final String candidateName;
  final String candidateParty;
  final String candidateImgUrl;
  final String candidateDescription;

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
      subtitle: Text(candidateDescription),
      trailing: Text(candidateParty),
    );
  }
}
