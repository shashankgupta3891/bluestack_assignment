import 'package:bluestack_assignment/modules/home/enum/tournament_stats_type.dart';
import 'package:flutter/material.dart';

class TournamentStatusCard extends StatelessWidget {
  const TournamentStatusCard(
      {Key? key, required this.stats, required this.statsCategory})
      : super(key: key);

  final int stats;
  final TournamentStatsType statsCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        gradient: statsCategory.gradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            statsCategory.getStats(stats),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            statsCategory.displayName,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
