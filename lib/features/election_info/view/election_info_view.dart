import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/election_info/view/election_info_viewmodel.dart';
import 'package:voting_app/features/election_info/widgets/info_tile.dart';

class ElectionInfoView extends StatelessWidget {
  const ElectionInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ElectionInfoViewmodel>.reactive(
        viewModelBuilder: () => ElectionInfoViewmodel(),
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: Colors.white,
              body: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => viewModel.back(),
                          child: const Icon(
                            Icons.keyboard_backspace,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Voting App Guide",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Election Guide and Information",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // Lists of infrmation tiles
                        Column(
                          children: viewModel.electionInfo
                              .map(
                                (info) => InfoTile(
                                    content: info["content"] ?? "",
                                    title: info["title"] ?? ""),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
