import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';

class ViewResultTile extends StatelessWidget {
  const ViewResultTile({
    super.key,
    required this.party,
    required this.votes,
  });
  final String party;
  final String votes;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        title: Text(party),
        trailing: Container(
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: ColorList.darkGreen,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            votes.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
