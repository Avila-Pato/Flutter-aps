import 'package:flutter/material.dart';
import 'package:maybe/domain/entities/message.dart';
import 'package:maybe/helpers/get_yes_no_answer.dart';

class ChatProviders extends ChangeNotifier {
  // final ScrollController chatScrollController = ScrollController();

  // control del Scroll
  final ScrollController chatScrollController = ScrollController();

  List<Message> messagesList = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "que?", fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    //Siemrpe el mensaje sera de mi
    messagesList.add(Message(text: text, fromWho: FromWho.me));

    if(text.endsWith("?")){
      herReply();
    }

    // si el provider cambio notifica a los listeners que hay un cambio
    notifyListeners();
    // movemos el scroll a la parte de abajo
    moveScrollToBottom();
  }

  Future<void> herReply() async {

    final herMessage = await GetYesNoAnswer().getAnswer();
    messagesList.add(herMessage);
    
    notifyListeners();
    moveScrollToBottom();
    
  }
  void moveScrollToBottom() {
    // esperamos a que Flutter dibuje el mensaje nuevo,
    // si no maxScrollExtent todavia no lo incluye
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!chatScrollController.hasClients) return;
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
