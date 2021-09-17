class UserModel {
  String? id;
  String? fullName;
  String? profilePicture;
  int? rating;
  String? userName;
  TournamentsStats? tournamentsStats;

  UserModel(
      {this.id,
      this.fullName,
      this.profilePicture,
      this.rating,
      this.userName,
      this.tournamentsStats});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePicture = json['profile_picture'];
    rating = json['rating'];
    userName = json['user_name'];
    tournamentsStats = json['tournaments_stats'] != null
        ? TournamentsStats.fromJson(json['tournaments_stats'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['profile_picture'] = profilePicture;
    data['rating'] = rating;
    data['user_name'] = userName;
    if (tournamentsStats != null) {
      data['tournaments_stats'] = tournamentsStats?.toJson();
    }
    return data;
  }
}

class TournamentsStats {
  int? played;
  int? won;

  TournamentsStats({this.played, this.won});

  TournamentsStats.fromJson(Map<String, dynamic> json) {
    played = json['played'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['played'] = played;
    data['won'] = won;
    return data;
  }
}
