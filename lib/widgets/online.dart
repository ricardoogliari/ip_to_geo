import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:myapp/data/remote/rest_client.dart';

class Online extends StatelessWidget {
  Online({super.key});

  final TextEditingController _ipController =
      TextEditingController(text: "170.244.27.242");

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final client = RestClient(dio);

    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _ipController,
              maxLength: 15,
              decoration: const InputDecoration(
                labelText: 'My IP',
              ),
            ),
            TextButton(
                onPressed: () {
                  client
                      .getGeoData(_ipController.text)
                      .then((geo) => print(geo), onError: (e) => print(e));
                },
                child: const Text("Find"))
          ],
        ));
  }
}
