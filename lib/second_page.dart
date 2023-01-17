import 'package:flutter/material.dart';
import 'package:model_class_provider/provider/provider_class.dart';
import 'package:provider/provider.dart';

class secnd extends StatelessWidget {
  const secnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    final list = prov.myList;
    List<IconData> lyst= prov.imList;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Favorite",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lime,
                    child: Icon(
                      lyst[index],
                      color: Colors.black,
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    "${list[index]}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        prov.favour(list[index], lyst[index]);
                      },
                      icon: (prov.icn(list[index]))
                          ? Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.red,
                      )
                          : Icon(Icons.favorite_border, size: 25))),
            );
          },
        ),
    );
  }
}
