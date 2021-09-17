import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/auth/model/user_model.dart';
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
    final winningPercentage = ((won / played) * 100).toInt().toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 85,
                width: 85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),

                  child: Image.network(
                    userModel?.profilePicture ??
                        "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    fit: BoxFit.cover,
                  ),

                  //  Image.asset(

                  //       "assets/images/default_face.jpg",
                  //   fit: BoxFit.cover,
                  // ),

                  // child: Image.network(
                  //   "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  //   fit: BoxFit.cover,
                  // ),

                  // child: CachedNetworkImage(
                  //   fit: BoxFit.cover,
                  //   imageUrl:
                  //       "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  //   height: 80,
                  //   width: 80,
                  //   alignment: Alignment.topCenter,

                  //   placeholder: (context, string) {
                  //     return Container(
                  //       color: Colors.red,
                  //     );
                  //   },
                  // ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        userModel?.fullName ?? "Shashank Gupta",
                        style: const TextStyle(fontSize: 24),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                    ),
                  ],
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
                    child: getStatsWidget(
                      played.toString(),
                      'Tournaments\nplayed',
                      const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.red, Colors.orange],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.0, right: 1),
                      child: getStatsWidget(
                        won.toString(),
                        'Tournaments\nwon',
                        const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: <Color>[Colors.blue, Colors.lightBlueAccent],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: getStatsWidget(
                      "${winningPercentage.toString()}%",
                      'Winning\npercentage',
                      const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.deepOrange, Colors.orange],
                      ),
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

Widget getStatsWidget(
    String stats, String statsCategory, LinearGradient gradient) {
  return Container(
    height: 100,
    decoration: BoxDecoration(gradient: gradient),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          stats,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          statsCategory,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
