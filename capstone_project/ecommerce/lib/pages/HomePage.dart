import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child: ListView(
        padding:  EdgeInsets.fromLTRB(width*0.04,height*0.003,width*0.04,0),
        children: [
         const ListTile(
          contentPadding: EdgeInsets.all(10),
            leading:  CircleAvatar(backgroundImage: AssetImage("assets/image/profile_img.jpg")),
            title: Text("Hello!"),
            subtitle: Text("John William",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            trailing: CircleAvatar(backgroundColor: Color(0XFFF8F7F7),child: Icon(Icons.notifications)),

          ),
          SearchBar(
             padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
            backgroundColor:const MaterialStatePropertyAll<Color?>(
                 Color(0XFFF8F7F7)),
            shadowColor:const MaterialStatePropertyAll<Color?>(
                 Colors.transparent),
            leading:const Icon(Icons.search),
            hintText: "Search here",
            hintStyle:const MaterialStatePropertyAll<TextStyle?> (
                TextStyle(color: Colors.grey,fontSize: 20)),
          
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor:const Color(0xFF6055D8),
      unselectedItemColor: Colors.grey,
      iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      )
    );
  }
}
