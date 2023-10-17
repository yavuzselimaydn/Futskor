class MatchInfo {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  MatchInfo({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
  });

  factory MatchInfo.fromJson(Map<String, dynamic> json) {
    return MatchInfo(
      fixture: json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null,
      league: json['league'] != null ? League.fromJson(json['league']) : null,
      teams: json['teams'] != null ? Teams.fromJson(json['teams']) : null,
      goals: json['goals'] != null ? Goals.fromJson(json['goals']) : null,
      score: json['score'] != null ? Score.fromJson(json['score']) : null,
    );
  }
  @override
  String toString() {

    return teams!.away.toString();
  }
}

class Fixture {
  int? id;
  dynamic referee;
  String? timezone;
  String? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['id'],
      referee: json['referee'],
      timezone: json['timezone'],
      date: json['date'],
      timestamp: json['timestamp'],
      periods: json['periods'] != null ? Periods.fromJson(json['periods']) : null,
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
    );
  }
}

class Periods {
  int? first;
  int? second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) {
    return Periods(
      first: json['first'],
      second: json['second'],
    );
  }
}

class Venue {
  int? id;
  String? name;
  String? city;

  Venue({this.id, this.name, this.city});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'],
      city: json['city'],
    );
  }
}

class Status {
  String? long;
  String? short;
  int? elapsed;

  Status({this.long, this.short, this.elapsed});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      long: json['long'],
      short: json['short'],
      elapsed: json['elapsed'],
    );
  }
}

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  dynamic flag;
  int? season;
  String? round;

  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      logo: json['logo'],
      flag: json['flag'],
      season: json['season'],
      round: json['round'],
    );
  }
}

class Teams {
  Team? home;
  Team? away;

  Teams({this.home, this.away});

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      home: json['home'] != null ? Team.fromJson(json['home']) : null,
      away: json['away'] != null ? Team.fromJson(json['away']) : null,
    );
  }
  
 
  
}

class Team {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Team({this.id, this.name, this.logo, this.winner});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      winner: json['winner'],
    );
  }
  @override
  String toString() {
    return name!;
  }
}

class Goals {
  int? home;
  int? away;

  Goals({this.home, this.away});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      home: json['home'],
      away: json['away'],
    );
  }
}

class Score {
  Halftime? halftime;
  Fulltime? fulltime;
  dynamic extratime;
  dynamic penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      halftime: json['halftime'] != null ? Halftime.fromJson(json['halftime']) : null,
      fulltime: json['fulltime'] != null ? Fulltime.fromJson(json['fulltime']) : null,
      extratime: json['extratime'],
      penalty: json['penalty'],
    );
  }
}

class Halftime {
  int? home;
  int? away;

  Halftime({this.home, this.away});

  factory Halftime.fromJson(Map<String, dynamic> json) {
    return Halftime(
      home: json['home'],
      away: json['away'],
    );
  }
}

class Fulltime {
  int? home;
  int? away;

  Fulltime({this.home, this.away});

  factory Fulltime.fromJson(Map<String, dynamic> json) {
    return Fulltime(
      home: json['home'],
      away: json['away'],
    );
  }
}
