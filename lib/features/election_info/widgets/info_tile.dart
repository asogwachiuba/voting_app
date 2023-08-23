import 'package:flutter/material.dart';
import 'package:voting_app/constants/color_list.dart';

class InfoTile extends StatefulWidget {
  const InfoTile({
    super.key,
    required this.content,
    required this.title,
  });
  final String title;
  final String content;

  @override
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(children: [
        // Title
        InkWell(
          onTap: () => setState(() {
            isExpanded = !isExpanded;
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: isExpanded ? ColorList.primaryColor : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                (isExpanded)
                    ? Icons.remove_circle_outline
                    : Icons.add_circle_outline,
                size: 20,
                color: isExpanded ? ColorList.primaryColor : Colors.black,
              )
            ],
          ),
        ),

        // Contents
        Visibility(
          visible: isExpanded,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  widget.content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Learn More: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "https://main.inecnigeria.org/?page_id=1167",
                    style: TextStyle(
                        color: ColorList.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!isExpanded)
          const SizedBox(
            height: 5,
          ),
        if (!isExpanded)
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
      ]),
    );
  }
}
