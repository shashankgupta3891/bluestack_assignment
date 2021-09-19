import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/auth/model/user_model.dart';
import 'package:bluestack_assignment/modules/home/components/tournament_status_card.dart';
import 'package:bluestack_assignment/modules/home/enum/tournament_stats_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? userModel =
        context.select<AuthProvider, UserModel?>((value) => value.userModel);

    final int won = userModel?.tournamentsStats?.won ?? 0;
    final int played = userModel?.tournamentsStats?.played ?? 0;
    final winningPercentage = ((won / played) * 100).toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 85,
                width: 85,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade200,
                ),
                child: Image.network(
                  userModel?.profilePicture ??
                      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userModel?.fullName ?? "Shashank Gupta",
                        style: const TextStyle(fontSize: 24),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(left: 16.0, right: 24),
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              userModel?.rating?.toString() ?? "2000",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(" "),
                            const Text(
                              'Elo rating',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: TournamentStatusCard(
                      stats: played,
                      statsCategory: TournamentStatsType.played,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.0, right: 1),
                      child: TournamentStatusCard(
                        stats: won,
                        statsCategory: TournamentStatsType.won,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TournamentStatusCard(
                      stats: winningPercentage,
                      statsCategory: TournamentStatsType.winningPercentage,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
