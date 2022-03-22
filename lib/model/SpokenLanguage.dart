class SpokenLanguage {
    String? englishName;
    String? iso;
    String? name;

    SpokenLanguage({this.englishName, this.iso, this.name});

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
        return SpokenLanguage(
            englishName: json['english_name'],
            iso: json['iso_639_1'],
            name: json['name'], 
        );
    }
}