import 'package:bluestack_assignment/core/constant/image_src_constant.dart';
import 'package:bluestack_assignment/core/constant/theme_constant.dart';
import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';
import 'package:flutter/material.dart';

class TournamentCard extends StatelessWidget {
  final Tournaments tournaments;
  const TournamentCard({Key? key, required this.tournaments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: kCardBoxShadow,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.network(
              tournaments.coverUrl ?? KImageConstant.defaultCoverImage,
              fit: BoxFit.cover,
            ),
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
                          style: TextStyle(color: Colors.grey.shade600),
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
