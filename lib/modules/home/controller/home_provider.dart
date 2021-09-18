import 'package:bluestack_assignment/core/api_repository/tournament_api_repository.dart';
import 'package:bluestack_assignment/modules/home/model/tournament_model.dart';
import 'package:dio/dio.dart' as dio;

import 'package:bluestack_assignment/common.dart';

class HomeProvider with ChangeNotifier {
  List<Tournaments> _tournamentsList = [];

  List<Tournaments> get tournamentsList => _tournamentsList;

  final TournamentApiRepository _tournamentApiRepository =
      locator.get<TournamentApiRepository>();

  String? _currentCursor =
      "CmMKGQoMcmVnX2VuZF9kYXRlEgkIgLTH_rqS7AISQmoOc35nYW1lLXR2LXByb2RyMAsSClRvdXJuYW1lbnQiIDIxMDQ5NzU3N2UwOTRmMTU4MWExMDUzODEwMDE3NWYyDBgAIAE=";

  String _status = "all";

  int _limit = 10;

  bool get canNext => _currentCursor != null;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchInitialList() async {
    dio.Response response;

    _isLoading = true;
    notifyListeners();

    try {
      response = await _tournamentApiRepository.fetchTournamentList();

      TournamentModel tournamentResponse;
      tournamentResponse =
          TournamentModel.fromJson(response.data as Map<String, dynamic>);

      _tournamentsList = [
        ..._tournamentsList,
        ...tournamentResponse.data?.tournaments ?? []
      ];
      _isLoading = false;

      notifyListeners();
    } on dio.DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> fetchNext() async {
    dio.Response response;

    _isLoading = true;
    notifyListeners();

    try {
      response = await _tournamentApiRepository.fetchTournamentList(
        limit: _limit,
        status: _status,
        cursor: _currentCursor ?? "",
      );

      TournamentModel tournamentResponse;
      tournamentResponse =
          TournamentModel.fromJson(response.data as Map<String, dynamic>);

      _currentCursor = tournamentResponse.data?.cursor;

      if (tournamentResponse.data?.tournaments?.isNotEmpty ?? false) {
        _tournamentsList = [
          ..._tournamentsList,
          ...tournamentResponse.data?.tournaments ?? []
        ];
      }
    } on dio.DioError catch (e) {
      debugPrint(e.message);

      throw Exception(e.message);
    } catch (e) {
      debugPrint(e.toString());

      throw Exception(e);
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }
}
