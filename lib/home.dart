import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Module.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Future<List<Module>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Module.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text('feTch dAta',
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future:fetchPosts(),
                    builder: (context,snapshot){
                    if(!snapshot.hasData){
                    return Text('Loding....');
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                        return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(snapshot.data![index].title.toString()),
                            SizedBox(height: 5,),
                            Text('Body',
                              style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                            Text(snapshot.data![index].body.toString()),
                            SizedBox(height: 5,),
                            Text('User ID: ${snapshot.data![index].userId}',
                              style: TextStyle(
                                 fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text('ID: ${snapshot.data![index].id}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      );
                    });

                  }
                }),
              ),
            ],
          ),
        ),
      ),
    ) ;
  }
}
