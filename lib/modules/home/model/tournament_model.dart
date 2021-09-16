class TournamentModel {
  int? code;
  Data? data;
  bool? success;

  TournamentModel({this.code, this.data, this.success});

  TournamentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data?.toJson() ?? {};
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  String? cursor;
  dynamic tournamentCount;
  List<Tournaments>? tournaments;
  bool? isLastBatch;

  Data({this.cursor, this.tournamentCount, this.tournaments, this.isLastBatch});

  Data.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    tournamentCount = json['tournament_count'];
    if (json['tournaments'] != null) {
      tournaments = <Tournaments>[];
      json['tournaments'].forEach((v) {
        tournaments?.add(Tournaments.fromJson(v));
      });
    }
    isLastBatch = json['is_last_batch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cursor'] = cursor;
    data['tournament_count'] = tournamentCount;
    if (tournaments != null) {
      data['tournaments'] = tournaments?.map((v) => v.toJson()).toList() ?? [];
    }
    data['is_last_batch'] = isLastBatch;
    return data;
  }
}

class Tournaments {
  bool? isCheckInRequired;
  String? tournamentId;
  bool? tournamentEnded;
  String? tournamentEndDate;
  bool? areRandomTeamsAllowed;
  int? registeredTeams;
  String? adminLocale;
  String? regEndDate;
  String? startDate;
  String? rules;
  int? maxTeams;
  String? tournamentUrl;
  String? prizes;
  String? matchStyleType;
  String? pwaUrl;
  String? tournamentType;
  String? geo;
  String? maxLevelId;
  bool? isPasswordRequired;
  String? name;
  String? matchStyle;
  String? registrationUrl;
  dynamic gamePkg;
  bool? isRegistrationOpen;
  bool? isWaitlistEnabled;
  bool? incompleteTeamsAllowed;
  bool? isAutoResultAllowed;
  int? teamSize;
  String? status;
  bool? isLevelsEnabled;
  bool? indexPage;
  String? dynamicAppUrl;
  String? minLevelId;
  String? gameFormat;
  String? details;
  String? gameIconUrl;
  String? regStartDate;
  int? winnersCount;
  String? coverUrl;
  String? bracketsUrl;
  String? tournamentSlug;
  String? discordUrl;
  String? gameId;
  bool? resultSubmissionByAdmin;
  String? country;
  String? adminUsername;
  String? gameName;
  String? streamUrl;

  Tournaments(
      {this.isCheckInRequired,
      this.tournamentId,
      this.tournamentEnded,
      this.tournamentEndDate,
      this.areRandomTeamsAllowed,
      this.registeredTeams,
      this.adminLocale,
      this.regEndDate,
      this.startDate,
      this.rules,
      this.maxTeams,
      this.tournamentUrl,
      this.prizes,
      this.matchStyleType,
      this.pwaUrl,
      this.tournamentType,
      this.geo,
      this.maxLevelId,
      this.isPasswordRequired,
      this.name,
      this.matchStyle,
      this.registrationUrl,
      this.gamePkg,
      this.isRegistrationOpen,
      this.isWaitlistEnabled,
      this.incompleteTeamsAllowed,
      this.isAutoResultAllowed,
      this.teamSize,
      this.status,
      this.isLevelsEnabled,
      this.indexPage,
      this.dynamicAppUrl,
      this.minLevelId,
      this.gameFormat,
      this.details,
      this.gameIconUrl,
      this.regStartDate,
      this.winnersCount,
      this.coverUrl,
      this.bracketsUrl,
      this.tournamentSlug,
      this.discordUrl,
      this.gameId,
      this.resultSubmissionByAdmin,
      this.country,
      this.adminUsername,
      this.gameName,
      this.streamUrl});

  Tournaments.fromJson(Map<String, dynamic> json) {
    isCheckInRequired = json['is_check_in_required'];
    tournamentId = json['tournament_id'];
    tournamentEnded = json['tournament_ended'];
    tournamentEndDate = json['tournament_end_date'];
    areRandomTeamsAllowed = json['are_random_teams_allowed'];
    registeredTeams = json['registered_teams'];
    adminLocale = json['admin_locale'];
    regEndDate = json['reg_end_date'];
    startDate = json['start_date'];
    rules = json['rules'];
    maxTeams = json['max_teams'];
    tournamentUrl = json['tournament_url'];
    prizes = json['prizes'];
    matchStyleType = json['match_style_type'];
    pwaUrl = json['pwa_url'];
    tournamentType = json['tournament_type'];
    geo = json['geo'];
    maxLevelId = json['max_level_id'];
    isPasswordRequired = json['is_password_required'];
    name = json['name'];
    matchStyle = json['match_style'];
    registrationUrl = json['registration_url'];
    gamePkg = json['game_pkg'];
    isRegistrationOpen = json['is_registration_open'];
    isWaitlistEnabled = json['is_waitlist_enabled'];
    incompleteTeamsAllowed = json['incomplete_teams_allowed'];
    isAutoResultAllowed = json['is_auto_result_allowed'];
    teamSize = json['team_size'];
    status = json['status'];
    isLevelsEnabled = json['is_levels_enabled'];
    indexPage = json['index_page'];
    dynamicAppUrl = json['dynamic_app_url'];
    minLevelId = json['min_level_id'];
    gameFormat = json['game_format'];
    details = json['details'];
    gameIconUrl = json['game_icon_url'];
    regStartDate = json['reg_start_date'];
    winnersCount = json['winners_count'];
    coverUrl = json['cover_url'];
    bracketsUrl = json['brackets_url'];
    tournamentSlug = json['tournament_slug'];
    discordUrl = json['discord_url'];
    gameId = json['game_id'];
    resultSubmissionByAdmin = json['result_submission_by_admin'];
    country = json['country'];
    adminUsername = json['admin_username'];
    gameName = json['game_name'];
    streamUrl = json['stream_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_check_in_required'] = isCheckInRequired;
    data['tournament_id'] = tournamentId;
    data['tournament_ended'] = tournamentEnded;
    data['tournament_end_date'] = tournamentEndDate;
    data['are_random_teams_allowed'] = areRandomTeamsAllowed;
    data['registered_teams'] = registeredTeams;
    data['admin_locale'] = adminLocale;
    data['reg_end_date'] = regEndDate;
    data['start_date'] = startDate;
    data['rules'] = rules;
    data['max_teams'] = maxTeams;
    data['tournament_url'] = tournamentUrl;
    data['prizes'] = prizes;
    data['match_style_type'] = matchStyleType;
    data['pwa_url'] = pwaUrl;
    data['tournament_type'] = tournamentType;
    data['geo'] = geo;
    data['max_level_id'] = maxLevelId;
    data['is_password_required'] = isPasswordRequired;
    data['name'] = name;
    data['match_style'] = matchStyle;
    data['registration_url'] = registrationUrl;
    data['game_pkg'] = gamePkg;
    data['is_registration_open'] = isRegistrationOpen;
    data['is_waitlist_enabled'] = isWaitlistEnabled;
    data['incomplete_teams_allowed'] = incompleteTeamsAllowed;
    data['is_auto_result_allowed'] = isAutoResultAllowed;
    data['team_size'] = teamSize;
    data['status'] = status;
    data['is_levels_enabled'] = isLevelsEnabled;
    data['index_page'] = indexPage;
    data['dynamic_app_url'] = dynamicAppUrl;
    data['min_level_id'] = minLevelId;
    data['game_format'] = gameFormat;
    data['details'] = details;
    data['game_icon_url'] = gameIconUrl;
    data['reg_start_date'] = regStartDate;
    data['winners_count'] = winnersCount;
    data['cover_url'] = coverUrl;
    data['brackets_url'] = bracketsUrl;
    data['tournament_slug'] = tournamentSlug;
    data['discord_url'] = discordUrl;
    data['game_id'] = gameId;
    data['result_submission_by_admin'] = resultSubmissionByAdmin;
    data['country'] = country;
    data['admin_username'] = adminUsername;
    data['game_name'] = gameName;
    data['stream_url'] = streamUrl;
    return data;
  }
}
