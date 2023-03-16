import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fhe_template/core.dart';
import 'package:get/get.dart';

class SiswaView extends StatefulWidget {
  const SiswaView({Key? key}) : super(key: key);

  Widget build(context, SiswaController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Data Siswa"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      "Pencarian",
                      style: TextStyle(color: Colors.blue[800]),
                    ),
                    content: Container(
                      child: TextFormField(
                        initialValue: controller.search,
                        onChanged: (value) {
                          controller.search = value;
                        },
                        decoration: InputDecoration(
                          labelText: "Free Text",
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800]),
                          onPressed: () {
                            controller.getWhere(controller.search.toString());
                            Get.back();
                            controller.search = "";
                          },
                          child: const Text("Search"))
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: controller.listSiswa.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = controller.listSiswa[index];
                  return InkWell(
                    onTap: () async {
                      await Get.off(
                        InputSiswaView(
                          item: item,
                        ),
                      );
                    },
                    child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (detail) {},
                      confirmDismiss: (direction) async {
                        bool confirm = false;
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                        'Are you sure you want to delete this item?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    confirm = true;
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirm) {
                          controller.deleteData(item['id'].toString());
                          return Future.value(true);
                        }
                        return Future.value(false);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                        File(item["image_url"].toString())),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['nama_siswa'] ?? "",
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      item['hp'] ?? "",
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      item['alamat'] ?? "",
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const InputSiswaView());
        },
      ),
    );
  }

  @override
  State<SiswaView> createState() => SiswaController();
}
