class CharactersModel {
    int? id;
    String? name;
    String? status;
    String? species;
    String? type;
    String? gender;
    Location? origin;
    Location? location;
    String? image;
    List? episode;
    String? url;
    String? created;

    CharactersModel({
        this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created,
    });

    factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        // episode: List<String>.from(json["episode"].map((x) => x)),
        episode: json["episode"],
        url: json["url"],
        created: json["created"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin,
        "location": location,
        "image": image,
        // "episode": List<dynamic>.from(episode!.map((x) => x)),
        "episode": episode,
        "url": url,
        "created": created,
    };
}

class Location {
    String? name;
    String? url;

    Location({
        this.name,
        this.url,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}