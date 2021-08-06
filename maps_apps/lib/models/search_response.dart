// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
    SearchResponse({
        this.type,
        this.query,
        this.features,
        this.attribution,
    });

    String type;
    List<String> query;
    List<Feature> features;
    String attribution;

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
    };
}

class Feature {
    Feature({
        this.id,
        this.type,
        this.placeType,
        this.relevance,
        this.properties,
        this.textPt,
        this.placeNamePt,
        this.text,
        this.placeName,
        this.bbox,
        this.center,
        this.geometry,
        this.context,
        this.languagePt,
        this.language,
    });

    String id;
    String type;
    List<String> placeType;
    double relevance;
    Properties properties;
    String textPt;
    String placeNamePt;
    String text;
    String placeName;
    List<double> bbox;
    List<double> center;
    Geometry geometry;
    List<Context> context;
    String languagePt;
    String language;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"].toDouble(),
        properties: Properties.fromJson(json["properties"]),
        textPt: json["text_pt"],
        placeNamePt: json["place_name_pt"],
        text: json["text"],
        placeName: json["place_name"],
        bbox: List<double>.from(json["bbox"].map((x) => x.toDouble())),
        center: List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
        context: json["context"] == null ? null : List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
        languagePt: json["language_pt"] == null ? null : json["language_pt"],
        language: json["language"] == null ? null : json["language"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text_pt": textPt,
        "place_name_pt": placeNamePt,
        "text": text,
        "place_name": placeName,
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
        "context": context == null ? null : List<dynamic>.from(context.map((x) => x.toJson())),
        "language_pt": languagePt == null ? null : languagePt,
        "language": language == null ? null : language,
    };
}

class Context {
    Context({
        this.id,
        this.wikidata,
        this.shortCode,
        this.textPt,
        this.languagePt,
        this.text,
        this.language,
    });

    String id;
    String wikidata;
    String shortCode;
    String textPt;
    String languagePt;
    String text;
    String language;

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json["id"],
        wikidata: json["wikidata"],
        shortCode: json["short_code"] == null ? null : json["short_code"],
        textPt: json["text_pt"],
        languagePt: json["language_pt"],
        text: json["text"],
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "wikidata": wikidata,
        "short_code": shortCode == null ? null : shortCode,
        "text_pt": textPt,
        "language_pt": languagePt,
        "text": text,
        "language": language,
    };
}

class Geometry {
    Geometry({
        this.type,
        this.coordinates,
    });

    String type;
    List<double> coordinates;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class Properties {
    Properties({
        this.wikidata,
        this.shortCode,
    });

    String wikidata;
    String shortCode;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        wikidata: json["wikidata"] == null ? null : json["wikidata"],
        shortCode: json["short_code"] == null ? null : json["short_code"],
    );

    Map<String, dynamic> toJson() => {
        "wikidata": wikidata == null ? null : wikidata,
        "short_code": shortCode == null ? null : shortCode,
    };
}
