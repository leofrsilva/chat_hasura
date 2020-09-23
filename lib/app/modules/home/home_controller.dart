import 'package:chat_hasura/app/app_repository.dart';
import 'package:chat_hasura/app/shared/models/message_model.dart';
import 'package:chat_hasura/app/shared/stores/user/user_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AppRepository repository;
  final UserStore _userStore;
  _HomeControllerBase(this.repository, this._userStore) {
    controllerTecladoChat = TextEditingController();
    messagesOut = repository.getMessages();
  }

  Stream<List<MessageModel>> messagesOut;

  TextEditingController controllerTecladoChat;

  Future sendMessage() async {
    var result = await this.repository.sendMessage(
          this._userStore.user.id,
          controllerTecladoChat.text.trim(),
        );
    controllerTecladoChat.clear();
  }
}
