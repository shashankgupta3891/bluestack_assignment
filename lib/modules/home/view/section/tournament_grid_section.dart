import 'package:bluestack_assignment/modules/home/components/tournament_card.dart';
import 'package:bluestack_assignment/modules/home/controller/tournament_provider.dart';
import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TournamentGridSection extends StatelessWidget {
  const TournamentGridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tournaments> tournamentList =
        context.select<TournamentProvider, List<Tournaments>>(
            (value) => value.tournamentsList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Recommended for you',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
        tournamentList.isEmpty
            ? const Text("Not available")
            : GridView.builder(
                // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                itemCount: tournamentList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.8,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, int index) => TournamentCard(
                  tournaments: tournamentList[index],
                ),
              ),
      ],
    );
  }
}
