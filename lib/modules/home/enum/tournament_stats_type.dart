import 'package:flutter/material.dart';

enum TournamentStatsType { played, won, winningPercentage }

extension TournamentStatusTypeExtension on TournamentStatsType {
  String getStats(int stats) {
    switch (this) {
      case TournamentStatsType.winningPercentage:
        return '$stats%';

      default:
        return "$stats";
    }
  }

  String get displayName {
    switch (this) {
      case TournamentStatsType.played:
        return 'Tournaments\nplayed';

      case TournamentStatsType.won:
        return 'Tournaments\nwon';

      case TournamentStatsType.winningPercentage:
        return 'Winning\npercentage';

      default:
        return "";
    }
  }

  Gradient get gradient {
    switch (this) {
      case TournamentStatsType.played:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xffFF8008), Color(0xffFFC837)],
        );

      case TournamentStatsType.won:
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff8E2DE2),
            Color(0xff4A00E0),
          ],
        );

      case TournamentStatsType.winningPercentage:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xfff12711),
            Color(0xfff5af19),
          ],
        );

      default:
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Colors.deepOrange, Colors.orange],
        );
    }
  }
}
