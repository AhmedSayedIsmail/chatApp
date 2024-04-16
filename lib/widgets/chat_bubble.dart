import 'package:chatapp/constants/constant.dart';
import 'package:chatapp/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  const ChatBubble({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    //we put Align widget to make container to take expanded screen width
    //take only width of container
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child:  Text(message.message.toString(),
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  final MessageModel message;
  const ChatBubbleForFriend({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    //we put Align widget to make container to take expanded screen width
    //take only width of container
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child:  Text(message.message.toString(),
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
