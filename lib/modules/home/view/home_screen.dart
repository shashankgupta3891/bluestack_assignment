import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Flyingwolf',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // RM.get<LoginViewModel>().setState((s) => s.onLogout()).then(
                //     (value) => Navigator.pushReplacementNamed(
                //         context, Screen.login.toString()));
              })
        ],
        elevation: 0,
        leading: const Icon(Icons.menu),
      ),
      // body: _getResponsiveHome(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getProfileView(),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recommended for you',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),

            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                // primary: true,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, int index) => const CustomCard())
            // UserDetailsWidget(),
            // Expanded(child: RecommendedCardList()),
          ],
        ),
      ),
    );
  }

  Widget getProfileView() {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
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
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 24),
                        child: Center(
                          child: Text.rich(
                            TextSpan(text: "2000", children: [
                              TextSpan(text: " "),
                              TextSpan(
                                text: "Elo rating",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ]),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          // child: Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: const <Widget>[
                          //     Text(
                          //       "2000",
                          //       style: TextStyle(
                          //           fontSize: 20,
                          //           color: Colors.blue,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //     Text(" "),
                          //     Text(
                          //       'Elo rating',
                          //       style: TextStyle(
                          //           color: Colors.blueGrey,
                          //           fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                        ),
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
                      'Tournaments\nplayed',
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
                        'Tournaments\nwon',
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
                      "  tournamentsState.getWinningPercentage() " + "%",
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
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "tournaments[index - 1].coverUrl",
                      height: 100,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 48),
                        child: Text(
                          " tournaments[index - 1].name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "tournaments[index - 1].gameName",
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}
