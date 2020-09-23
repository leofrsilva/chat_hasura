import 'package:chat_hasura/app/modules/home/widgets/typing_field.dart';
import 'package:chat_hasura/app/shared/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<MessageModel>>(
          stream: controller.messagesOut,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var message = snapshot.data[index];
                        return ListTile(
                          title: Text(message.user.name),
                          subtitle: Text(message.content),
                        );
                      },
                    ),
                  ),
                  TypingField(
                    controller: controller.controllerTecladoChat,
                    onPressed: controller.sendMessage,
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
