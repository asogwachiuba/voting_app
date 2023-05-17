import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/election_info/view/election_info_viewmodel.dart';
import 'package:voting_app/features/election_info/widgets/info_tile.dart';
import 'package:voting_app/widgets/options_app_bar.dart';

class ElectionInfoView extends StatelessWidget {
  const ElectionInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ElectionInfoViewmodel>.reactive(
        viewModelBuilder: () => ElectionInfoViewmodel(),
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SizedBox.expand(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const OptionsAppBar(
                          title: 'Voting App Guide',
                          subtitle: "Click on the buttons for more information",
                        ),

                        // Lists of infrmation tiles
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: viewModel.electionInfo
                                .map(
                                  (info) => InfoTile(
                                      content: info["content"] ?? "",
                                      title: info["title"] ?? ""),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
