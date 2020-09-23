// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<UserModel> _$userComputed;

  @override
  UserModel get user => (_$userComputed ??=
          Computed<UserModel>(() => super.user, name: '_UserStoreBase.user'))
      .value;

  final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase');

  @override
  dynamic setUser(UserModel value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
