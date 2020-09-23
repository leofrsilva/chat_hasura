import 'package:chat_hasura/app/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  UserModel _userModel;

  @action
  setUser(UserModel value) => this._userModel = value;

  @computed
  UserModel get user => this._userModel;
}