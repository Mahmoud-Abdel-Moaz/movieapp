class ProductionCompany {
    int? id;
    String? logoPath;
    String? name;
    String? originCountry;

    ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

    factory ProductionCompany.fromJson(Map<String, dynamic> json) {
        return ProductionCompany(
            id: json['id'], 
            logoPath: json['logo_path'],
            name: json['name'], 
            originCountry: json['origin_country'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['logo_path'] = this.logoPath;
        data['name'] = this.name;
        data['origin_country'] = this.originCountry;
        return data;
    }
}