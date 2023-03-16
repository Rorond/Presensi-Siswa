import 'dart:io';

import 'package:flutter/material.dart';
import '../controller/input_siswa_controller.dart';
import 'package:fhe_template/core.dart';

class InputSiswaView extends StatefulWidget {
  final Map? item;
  const InputSiswaView({Key? key, this.item}) : super(key: key);

  @override
  Widget build(context, InputSiswaController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(item == null ? "Add Siswa" : "Update Siswa"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: controller.foto != ""
                      ? InkWell(
                          onTap: () {
                            controller.chooseImage();
                          },
                          child: controller.foto == ""
                              ? const Icon(
                                  Icons.image_outlined,
                                  size: 100,
                                  color: Colors.grey,
                                )
                              : Image.file(
                                  File(
                                    controller.foto.toString(),
                                  ),
                                  width: 250,
                                  height: 100,
                                ),
                        )
                      : InkWell(
                          onTap: () {
                            controller.chooseImage();
                          },
                          child: controller.image == null
                              ? const Icon(
                                  Icons.image_outlined,
                                  size: 100,
                                  color: Colors.grey,
                                )
                              : Image.file(
                                  File(
                                    controller.foto.toString(),
                                  ),
                                  width: 250,
                                  height: 100,
                                ),
                        )),
              TextFormField(
                initialValue: controller.nis,
                decoration: const InputDecoration(
                  labelText: 'NIS',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.nis = value;
                },
              ),
              TextFormField(
                initialValue: controller.namaSiswa,
                decoration: const InputDecoration(
                  labelText: 'Nama Siswa',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.namaSiswa = value;
                },
              ),
              TextFormField(
                initialValue: controller.tempatLahir,
                decoration: const InputDecoration(
                  labelText: 'Tempat Lahir',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.tempatLahir = value;
                },
              ),
              TextFormField(
                initialValue: controller.hp,
                decoration: const InputDecoration(
                  labelText: 'No Hp',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.hp = value;
                },
              ),
              TextFormField(
                initialValue: controller.alamat,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.alamat = value;
                },
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    controller.edit == true
                        ? controller.doUpdate(controller.id.toString())
                        : controller.doSave();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<InputSiswaView> createState() => InputSiswaController();
}
