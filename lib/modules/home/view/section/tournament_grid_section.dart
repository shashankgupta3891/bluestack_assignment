import 'package:bluestack_assignment/modules/home/components/tournament_card.dart';
import 'package:bluestack_assignment/modules/home/controller/home_provider.dart';
import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';

import 'package:bluestack_assignment/common.dart';

class TournamentGridSection extends StatelessWidget {
  const TournamentGridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String recommendedForYouText =
        AppLocalizations.of(context)?.recommendedForYou ??
            'Recommended for you';

    final String notAvailableText =
        AppLocalizations.of(context)?.notAvailable ?? "Not available";

    List<Tournaments> tournamentList =
        context.select<HomeProvider, List<Tournaments>>(
            (value) => value.tournamentsList);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 8),
          child: Text(
            recommendedForYouText,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        tournamentList.isEmpty
            ? Text(notAvailableText)
            : GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
