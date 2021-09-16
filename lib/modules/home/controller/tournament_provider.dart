import 'package:bluestack_assignment/core/api_repository/tournament_api_repository.dart';
import 'package:bluestack_assignment/locator.dart';
import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

class TournamentProvider with ChangeNotifier {
  List<Tournaments> _tournamentsList = [];

  List<Tournaments> get tournamentsList => _tournamentsList;

  final TournamentApiRepository _tournamentApiRepository =
      locator.get<TournamentApiRepository>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getTournamentList() async {
    dio.Response response;

    _isLoading = true;
    notifyListeners();

    try {
      response = await _tournamentApiRepository.fetchTournaments();

      if (response.statusCode == 200) {
        TournamentModel tournamentResponse;
        tournamentResponse =
            TournamentModel.fromJson(response.data as Map<String, dynamic>);

        _tournamentsList = [
          ..._tournamentsList,
          ...tournamentResponse.data?.tournaments ?? []
        ];
        _isLoading = false;

        notifyListeners();
        // _userModel = touranamentResponse;

        // Navigator.pushNamedAndRemoveUntil(
        //     context, DashboardScreen.routeName, (route) => false);
      } else {
        // final String msg = response.statusMessage ?? "Some Error";

        // Toast.show(msg, context,
        //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    } on dio.DioError catch (e) {
      print("e.message");
      print(e.message);
      // final String msg = e.response?.statusMessage ?? "Some Error";

      // Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
    } catch (e) {
      print("e.message");
      print(e);
      // debugPrint(e.toString());

      // final String msg = e?.response?.statusCode == 404
      //     ? "Email or Password is incorrect"
      //     : e?.response?.statusMessage as String;

      // Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
    }
  }
}
