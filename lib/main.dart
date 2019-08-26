import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      title: "GQL App",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(uri: "https://flutter-graphql-demo.herokuapp.com/v1/graphql");
    
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject
        ),
      ),
    );

    return GraphQLProvider(
      child: HomePage(),
      client: client,
    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final String query = r"""
    mutation insert_continent($name:String!, $code:String!) {
      insert_continents(objects: [{name: $name, code: $code}]) {
        returning {
          name
          code
        }  
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GQL CRUD"),
      ),
      body: Mutation(
        options: MutationOptions(
          document: query,
        ),
        builder: (RunMutation insert, QueryResult result) {// RunMutation run the query; QueryResult returns the response
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: nameController,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Code"),
                  controller: codeController,
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    insert(<String, dynamic>{
                      "name" : nameController.text,
                      "code" : codeController.text,
                    });
                  },
                ),
                Text(
                  "Result : \n ${result.data?.data?.toString()}"
                )
              ],
            ),
          );
        },
        onCompleted: (result) {
          print("onCompleted called");
        },
      ),
    );
  }
}