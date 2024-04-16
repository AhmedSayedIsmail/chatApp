import 'package:chatapp/constants/constant.dart';
import 'package:chatapp/models/message_model.dart';
import 'package:chatapp/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'ChatPage';
  final _controller =
      ScrollController(); //this controller to control the list view to go to the end
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            //log(snapshot.data!.docs[0]['message']);
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading:
                      false, //this to hide the back arrow
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        kLogo,
                        height: 50,
                      ),
                      const Text('Chat')
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) => messagesList[index].id == email? ChatBubble(
                          message: messagesList[index],
                        ):ChatBubbleForFriend(message: messagesList[index],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add(
                              {kMessage: data, kCreatedAt: DateTime.now(),'id':email});
                          controller
                              .clear(); //this to clear the data that inside textfield
                          //_controller this to go to last message that sended
                          _controller.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        },
                        decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: Icon(Icons.send)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor)),
                        ),
                      ),
                    )
                  ],
                ));
          } else {
            return Text("loading");
          }
        });
  }
}
