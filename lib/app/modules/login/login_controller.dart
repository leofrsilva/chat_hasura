import 'package:chat_hasura/app/app_repository.dart';
import 'package:chat_hasura/app/shared/stores/user/user_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase extends Disposable with Store {
  final AppRepository repository;
  final UserStore userStore;
  TextEditingController controllerNickName = TextEditingController();

  _LoginControllerBase(this.repository, this.userStore);

  Future<bool> login() async {
    try {
      final user = await repository.getUser(controllerNickName.text.trim());
      this.userStore.setUser(user);
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future acessar() async {
    bool result = await login();
    if(result){
      Modular.to.pushReplacementNamed("/home");
    }    
  }

  @override
  void dispose() {
    controllerNickName.dispose();
  }
}
