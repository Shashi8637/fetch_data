import 'package:fetch_data/home.dart';
import 'package:flutter/material.dart';



class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Home(),)
                );
                },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green[100],
                ),
                child: Center(
                  child: Text('Click Me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
