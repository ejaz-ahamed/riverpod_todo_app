import 'package:flutter/material.dart';
import 'package:state_management/services/api_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: const Text("Home API"),
      ),
      body: FutureBuilder(
          future: AppServices.getPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return Center(
                child: TextButton(
                    onPressed: () {
                      AppServices.getPosts();
                    },
                    child: const Text("Something went wrong..Please retry")),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return Card(
                  color: Colors.deepPurple,
                  child: ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.userId.toString()),
                  ),
                );
              },
            );
          }),
    );
  }
}
