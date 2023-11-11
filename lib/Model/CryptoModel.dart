class CryptoModel {
  CryptoModel({
    Status? status,
    List<Data>? data,
  }) {
    _status = status;
    _data = data;
  }

  CryptoModel.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Status? _status;
  List<Data>? _data;

  Status? get status => _status;
  List<Data>? get data => _data;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    int? numMarketPairs,
    String? dateAdded,
    List<String>? tags,
    int? maxSupply,
    int? circulatingSupply,
    int? totalSupply,
    bool? infiniteSupply,
    dynamic platform,
    int? cmcRank,
    dynamic selfReportedCirculatingSupply,
    dynamic selfReportedMarketCap,
    dynamic tvlRatio,
    String? lastUpdated,
    Quote? quote,
  }) {
    _id = id;
    _name = name;
    _symbol = symbol;
    _slug = slug;
    _numMarketPairs = numMarketPairs;
    _dateAdded = dateAdded;
    _tags = tags;
    _maxSupply = maxSupply;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _infiniteSupply = infiniteSupply;
    _platform = platform;
    _cmcRank = cmcRank;
    _selfReportedCirculatingSupply = selfReportedCirculatingSupply;
    _selfReportedMarketCap = selfReportedMarketCap;
    _tvlRatio = tvlRatio;
    _lastUpdated = lastUpdated;
    _quote = quote;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _slug = json['slug'];
    _numMarketPairs = json['num_market_pairs'];
    _dateAdded = json['date_added'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _maxSupply = json['max_supply'];
    _circulatingSupply = json['circulating_supply'];
    _totalSupply = json['total_supply'];
    _infiniteSupply = json['infinite_supply'];
    _platform = json['platform'];
    _cmcRank = json['cmc_rank'];
    _selfReportedCirculatingSupply = json['self_reported_circulating_supply'];
    _selfReportedMarketCap = json['self_reported_market_cap'];
    _tvlRatio = json['tvl_ratio'];
    _lastUpdated = json['last_updated'];
    _quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }
  int? _id;
  String? _name;
  String? _symbol;
  String? _slug;
  int? _numMarketPairs;
  String? _dateAdded;
  List<String>? _tags;
  int? _maxSupply;
  int? _circulatingSupply;
  int? _totalSupply;
  bool? _infiniteSupply;
  dynamic _platform;
  int? _cmcRank;
  dynamic _selfReportedCirculatingSupply;
  dynamic _selfReportedMarketCap;
  dynamic _tvlRatio;
  String? _lastUpdated;
  Quote? _quote;

  int? get id => _id;
  String? get name => _name;
  String? get symbol => _symbol;
  String? get slug => _slug;
  int? get numMarketPairs => _numMarketPairs;
  String? get dateAdded => _dateAdded;
  List<String>? get tags => _tags;
  int? get maxSupply => _maxSupply;
  int? get circulatingSupply => _circulatingSupply;
  int? get totalSupply => _totalSupply;
  bool? get infiniteSupply => _infiniteSupply;
  dynamic get platform => _platform;
  int? get cmcRank => _cmcRank;
  dynamic get selfReportedCirculatingSupply => _selfReportedCirculatingSupply;
  dynamic get selfReportedMarketCap => _selfReportedMarketCap;
  dynamic get tvlRatio => _tvlRatio;
  String? get lastUpdated => _lastUpdated;
  Quote? get quote => _quote;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['slug'] = _slug;
    map['num_market_pairs'] = _numMarketPairs;
    map['date_added'] = _dateAdded;
    map['tags'] = _tags;
    map['max_supply'] = _maxSupply;
    map['circulating_supply'] = _circulatingSupply;
    map['total_supply'] = _totalSupply;
    map['infinite_supply'] = _infiniteSupply;
    map['platform'] = _platform;
    map['cmc_rank'] = _cmcRank;
    map['self_reported_circulating_supply'] = _selfReportedCirculatingSupply;
    map['self_reported_market_cap'] = _selfReportedMarketCap;
    map['tvl_ratio'] = _tvlRatio;
    map['last_updated'] = _lastUpdated;
    if (_quote != null) {
      map['quote'] = _quote?.toJson();
    }
    return map;
  }
}

class Quote {
  Quote({
    Usd? usd,
  }) {
    _usd = usd;
  }

  Quote.fromJson(dynamic json) {
    _usd = json['USD'] != null ? Usd.fromJson(json['USD']) : null;
  }
  Usd? _usd;

  Usd? get usd => _usd;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    if (_usd != null) {
      map['USD'] = _usd?.toJson();
    }
    return map;
  }
}

class Usd {
  Usd({
    double? price,
    double? volume24h,
    double? volumeChange24h,
    double? percentChange1h,
    double? percentChange24h,
    double? percentChange7d,
    double? percentChange30d,
    double? percentChange60d,
    double? percentChange90d,
    double? marketCap,
    double? marketCapDominance,
    double? fullyDilutedMarketCap,
    dynamic tvl,
    String? lastUpdated,
  }) {
    _price = price;
    _volume24h = volume24h;
    _volumeChange24h = volumeChange24h;
    _percentChange1h = percentChange1h;
    _percentChange24h = percentChange24h;
    _percentChange7d = percentChange7d;
    _percentChange30d = percentChange30d;
    _percentChange60d = percentChange60d;
    _percentChange90d = percentChange90d;
    _marketCap = marketCap;
    _marketCapDominance = marketCapDominance;
    _fullyDilutedMarketCap = fullyDilutedMarketCap;
    _tvl = tvl;
    _lastUpdated = lastUpdated;
  }

  Usd.fromJson(dynamic json) {
    _price = json['price'];
    _volume24h = json['volume_24h'];
    _volumeChange24h = json['volume_change_24h'];
    _percentChange1h = json['percent_change_1h'];
    _percentChange24h = json['percent_change_24h'];
    _percentChange7d = json['percent_change_7d'];
    _percentChange30d = json['percent_change_30d'];
    _percentChange60d = json['percent_change_60d'];
    _percentChange90d = json['percent_change_90d'];
    _marketCap = json['market_cap'];
    _marketCapDominance = json['market_cap_dominance'];
    _fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    _tvl = json['tvl'];
    _lastUpdated = json['last_updated'];
  }
  double? _price;
  double? _volume24h;
  double? _volumeChange24h;
  double? _percentChange1h;
  double? _percentChange24h;
  double? _percentChange7d;
  double? _percentChange30d;
  double? _percentChange60d;
  double? _percentChange90d;
  double? _marketCap;
  double? _marketCapDominance;
  double? _fullyDilutedMarketCap;
  dynamic _tvl;
  String? _lastUpdated;

  double? get price => _price;
  double? get volume24h => _volume24h;
  double? get volumeChange24h => _volumeChange24h;
  double? get percentChange1h => _percentChange1h;
  double? get percentChange24h => _percentChange24h;
  double? get percentChange7d => _percentChange7d;
  double? get percentChange30d => _percentChange30d;
  double? get percentChange60d => _percentChange60d;
  double? get percentChange90d => _percentChange90d;
  double? get marketCap => _marketCap;
  double? get marketCapDominance => _marketCapDominance;
  double? get fullyDilutedMarketCap => _fullyDilutedMarketCap;
  dynamic get tvl => _tvl;
  String? get lastUpdated => _lastUpdated;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['price'] = _price;
    map['volume_24h'] = _volume24h;
    map['volume_change_24h'] = _volumeChange24h;
    map['percent_change_1h'] = _percentChange1h;
    map['percent_change_24h'] = _percentChange24h;
    map['percent_change_7d'] = _percentChange7d;
    map['percent_change_30d'] = _percentChange30d;
    map['percent_change_60d'] = _percentChange60d;
    map['percent_change_90d'] = _percentChange90d;
    map['market_cap'] = _marketCap;
    map['market_cap_dominance'] = _marketCapDominance;
    map['fully_diluted_market_cap'] = _fullyDilutedMarketCap;
    map['tvl'] = _tvl;
    map['last_updated'] = _lastUpdated;
    return map;
  }
}

class Status {
  Status({
    String? timestamp,
    int? errorCode,
    dynamic errorMessage,
    int? elapsed,
    int? creditCount,
    dynamic notice,
    int? totalCount,
  }) {
    _timestamp = timestamp;
    _errorCode = errorCode;
    _errorMessage = errorMessage;
    _elapsed = elapsed;
    _creditCount = creditCount;
    _notice = notice;
    _totalCount = totalCount;
  }

  Status.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _errorCode = json['error_code'];
    _errorMessage = json['error_message'];
    _elapsed = json['elapsed'];
    _creditCount = json['credit_count'];
    _notice = json['notice'];
    _totalCount = json['total_count'];
  }
  String? _timestamp;
  int? _errorCode;
  dynamic _errorMessage;
  int? _elapsed;
  int? _creditCount;
  dynamic _notice;
  int? _totalCount;

  String? get timestamp => _timestamp;
  int? get errorCode => _errorCode;
  dynamic get errorMessage => _errorMessage;
  int? get elapsed => _elapsed;
  int? get creditCount => _creditCount;
  dynamic get notice => _notice;
  int? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = _timestamp;
    map['error_code'] = _errorCode;
    map['error_message'] = _errorMessage;
    map['elapsed'] = _elapsed;
    map['credit_count'] = _creditCount;
    map['notice'] = _notice;
    map['total_count'] = _totalCount;
    return map;
  }
}
