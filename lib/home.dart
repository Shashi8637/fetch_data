import 'package:fetch_data/Provider/appProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Consumer<appProvider>(builder: (context,provider,child){
                return Expanded(
                  child: FutureBuilder(
                      future: provider.fetchPosts(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }else{
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => PostPage(index: index),)
                                    );
                                  },
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Tittle",
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
                                  ),
                                );
                              });
                        }
                      }),
                );
              })

            ],
          ),
        ),
      ),
    ) ;
  }
}



class PostPage extends StatelessWidget {
   PostPage({
     required this.index,
     Key? key}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<appProvider>(builder: (contect,provider,child){
      return FutureBuilder(
        future: provider.fetchPosts(),
          builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Tittle",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(snapshot.data![index].title.toString()),
                  Text(snapshot.data.runtimeType.toString()),
                  SizedBox(height: 5,),
                  Text('Body',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),
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
          }
      });
    });
  }
}
