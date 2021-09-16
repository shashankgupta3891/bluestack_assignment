import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 85,
                width: 85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),

                  child: Image.asset(
                    "assets/images/default_face.jpg",
                    fit: BoxFit.cover,
                  ),

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
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Shashank Gupta",
                      style: TextStyle(fontSize: 24),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "2000",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(" "),
                          Text(
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
                      '34',
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
                        '09',
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
                      "26%",
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
