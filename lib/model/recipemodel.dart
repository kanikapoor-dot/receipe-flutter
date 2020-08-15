class RecipeModel {
  String label;
  String image;
  String source;
  String postUrl;

  RecipeModel({this.label, this.image, this.source, this.postUrl});

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
        label: parsedJson["label"],
        image: parsedJson["image"],
        source: parsedJson["source"],
        postUrl: parsedJson["url"]);
  }
}
