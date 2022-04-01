import 'package:flutter/material.dart';
import 'api.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Info from API")),
      body: FutureBuilder(
          future: GetData().getinfo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.cyan,
                        radius: 20,
                        child: Text(snapshot.data[index]['id'].toString()),
                      ),
                      title: Text(
                        snapshot.data[index]["name"],
                      ),
                      subtitle: Text(
                        snapshot.data[index]["email"],
                      ), 
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
