import 'package:bluestack_assignment/modules/home/controller/tournament_provider.dart';
import 'package:bluestack_assignment/modules/home/view/section/profile_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'section/tournament_grid_section.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      // context.read<AuthProvider>().getUserDetails(context);

      await context.read<TournamentProvider>().getTournamentList();
    });
  }

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
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: () {})],
        elevation: 0,
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Selector<TournamentProvider, bool>(
            selector: (_, tournamentProvider) => tournamentProvider.isLoading,
            builder: (_, bool loader, __) =>
                loader ? const LinearProgressIndicator() : Container(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: const [
                  ProfileView(),
                  TournamentGridSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
