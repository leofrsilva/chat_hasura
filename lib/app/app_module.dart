import 'package:chat_hasura/app/modules/home/home_module.dart';
import 'package:chat_hasura/app/shared/stores/user/user_store.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:chat_hasura/app/app_widget.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'app_repository.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AppRepository(i.get<HasuraConnect>())),

        Bind((i) => HasuraConnect(HASURA_URL)),
        Bind((i) => UserStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
