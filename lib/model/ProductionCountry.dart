class ProductionCountry {
    String? iso;
    String? name;

    ProductionCountry({this.iso, this.name});

    factory ProductionCountry.fromJson(Map<String, dynamic> json) {
        return ProductionCountry(
            iso: json['iso_3166_1'],
            name: json['name'], 
        );
    }
}