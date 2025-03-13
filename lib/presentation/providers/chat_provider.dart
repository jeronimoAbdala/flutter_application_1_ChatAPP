import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();


  List<Message> message = [
    Message(text: 'hola amor', fromWho: FromWho.mine),
    Message(text: 'ya llegaste del trabajo?', fromWho: FromWho.mine),

  ];
  
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    message.add(newMessage);

    if(text.endsWith('?')) {
       herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    message.add(herMessage);

    notifyListeners();
     moveScrollToBottom();
  }


void moveScrollToBottom() {
  chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300 ), curve: Curves.easeInOut);
}
}