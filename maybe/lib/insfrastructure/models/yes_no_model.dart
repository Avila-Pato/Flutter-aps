import 'package:maybe/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  // Convertir la respuesta a un mapa de JSON
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  //Mapiar el modelo a un mapa de JSON
  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  // enviar la respuesta al modelo de YesNoModel
  Message toMessageEntity() => Message(
    text: answer == 'yes'
        ? 'Si'
        : answer == 'no'
        ? 'No'
        : 'Tal vez',
    fromWho: FromWho.hers,
    imageUrl: image,
  );
  static YesNoModel fromJsonMap(Map<String, dynamic> data) {
    return YesNoModel.fromJson(data);
  }
}
