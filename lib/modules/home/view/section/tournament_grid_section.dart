import 'package:bluestack_assignment/modules/home/components/tournament_card.dart';
import 'package:bluestack_assignment/modules/home/controller/home_provider.dart';
import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TournamentGridSection extends StatelessWidget {
  const TournamentGridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tournaments> tournamentList =
        context.select<HomeProvider, List<Tournaments>>(
            (value) => value.tournamentsList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16, left: 16, top: 8),
          child: Text(
            'Recommended for you',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        tournamentList.isEmpty
            ? const Text("Not available")
            : GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                itemCount: tournamentList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (_, int index) => TournamentCard(
                  tournaments: tournamentList[index],
                ),
              ),
      ],
    );
  }
}
