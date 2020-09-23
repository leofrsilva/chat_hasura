import 'package:chat_hasura/app/shared/models/message_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'shared/models/user_model.dart';

const HASURA_URL = "https://br-maxleco-chat-exemple.herokuapp.com/v1/graphql";

class AppRepository extends Disposable {
  final HasuraConnect connection;

  AppRepository(this.connection);

  Future<UserModel> getUser(String user) async {
    String q = """
    query getUser(\$name:String!){
      users(where: {name: {_eq: \$name}}) {
        id
        name
      }
    }
    """;

    var response = await connection.query(q, variables: {"name": user});
    if ((response["data"]["users"] as List).length == 0) {
      // Criar Mutation
      return createUser(user);
    } else {
      return UserModel.fromJson(response["data"]["users"][0]);
    }
  }

  Future<UserModel> createUser(String name) async {
    String q = """
    mutation createUser(\$name:String!) {
      insert_users(objects: {name: \$name}) {
        returning {
          id
        }
      }
    }
    """;
    final response = await connection.mutation(q, variables: {"name": name});
    int id = response["data"]["insert_users"]["returning"][0]["id"];
    return UserModel(id: id, name: name);
  }

  Stream<List<MessageModel>> getMessages() {
    String q = """
    subscription {
      messages(order_by: {id: desc}) {
        content
        id
        user {
          id
          name
        }
      }
    }
    """;
    Snapshot snapshot = connection.subscription(q);
    return snapshot.asBroadcastStream().map(
        (jsonList) => MessageModel.fromJsonList(jsonList["data"]["messages"]));
  }

  Future<dynamic> sendMessage(int userId, String message) async {
    String q = """
    mutation sendMessage(\$userId:Int!,\$message:String!) {
      insert_messages(objects: {id_usuario: \$userId, content: \$message}) {
        affected_rows
      }
    }
    """;
    return await connection.mutation(q, variables: {
      "userId": userId,
      "message": message,
    });
  }

  @override
  void dispose() {}
}
