import 'package:flutter/material.dart';
import 'package:model_class_provider/provider/provider_class.dart';
import 'package:model_class_provider/second_page.dart';
import 'package:provider/provider.dart';

import 'model_class.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => MyProvider()),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lime),
        home: const English(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class English extends StatefulWidget {
  const English({Key? key}) : super(key: key);

  @override
  State<English> createState() => _EnglishState();
}

class _EnglishState extends State<English> {
  TextEditingController Search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List c = [
      modelclass(c1: "Sports India", c2: Icons.sports_baseball),
      modelclass(c1: "Science India", c2: Icons.science_outlined),
      modelclass(c1: "News India", c2: Icons.newspaper),
      modelclass(c1: "World India", c2: Icons.wordpress),
      modelclass(c1: "Entertainment India", c2: Icons.sports_baseball)
    ];

    final prov = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Icon(
          Icons.home,
          color: Colors.black,
        ),
      ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: Search,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                label: Text("Search"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: "Search"),

          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.power_settings_new,
            color: Colors.black,
          ),
        ),],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: c.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white30,
                  child: Icon(
                    c[index].c2,
                    color: Colors.black,
                  ),
                  radius: 30,
                ),
                title: Text(
                  "${c[index].c1}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      prov.favour(c[index].c1, c[index].c2);
                    },
                    icon: (prov.icn(c[index].c1))
                        ? Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border, size: 25))),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => secnd()),
          );
        },
        label: Text(
          "Favorites",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
