import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';
import 'package:flutter/material.dart';

class TournamentCard extends StatelessWidget {
  final Tournaments tournaments;
  const TournamentCard({Key? key, required this.tournaments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.network(
              tournaments.coverUrl ??
                  "https://images.pexels.com/photos/371924/pexels-photo-371924.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              fit: BoxFit.cover,
            ),
            // child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     CachedNetworkImage(
            //       fit: BoxFit.fitWidth,
            //       imageUrl:
            //           "https://images.pexels.com/photos/371924/pexels-photo-371924.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            //     ),
            //   ],
            // ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 48),
                        child: Text(
                          tournaments.name ??
                              "Fortnite Champions Mar 2020 Tournaments",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          tournaments.gameName ?? "Fortnite",
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}
