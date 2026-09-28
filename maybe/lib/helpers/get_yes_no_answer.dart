import 'package:dio/dio.dart';
import 'package:maybe/domain/entities/message.dart';
import 'package:maybe/insfrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  // Dio es un http client para flutter
  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');
   
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    if(response.statusCode != 200 ) throw Exception("Error en la petición");

    return yesNoModel.toMessageEntity();   
  }
}