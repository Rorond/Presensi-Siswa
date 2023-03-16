import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../service/databaseHelper.dart';

class InputSiswaController extends State<InputSiswaView>
    implements MvcController {
  static late InputSiswaController instance;
  late InputSiswaView view;
  @override
  void initState() {
    instance = this;
    super.initState();
    if (widget.item != null) {
      id = widget.item!["id"].toString();
      nis = widget.item!['nis'];
      namaSiswa = widget.item!['nama_siswa'];
      tempatLahir = widget.item!['tempat_lahir'];
      alamat = widget.item!['alamat'].toString();
      hp = widget.item!['hp'].toString();
      foto = widget.item!['image_url'];
      edit = true;
    }
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? id;
  String? nis;
  String? namaSiswa;
  String? tempatLahir;
  String? alamat;
  String? hp;
  String? imageUrl;
  String? foto = "";
  XFile? image;
  DateTime? created_date = DateTime.now();
  bool? edit = false;

  Future _onCamera() async {
    final gambar = await ImagePicker().pickImage(source: ImageSource.camera);
    if (gambar == null) return;
    setState(() {
      image = gambar;
      foto = gambar.path;
    });
  }

  Future _onGallery() async {
    final gambar = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (gambar == null) return;
    setState(() {
      image = gambar;
      foto = gambar.path;
    });
  }

  chooseImage() async {
    showDialog(
      context: context,
      builder: (BuildContext) => AlertDialog(
        title: const Center(
          child: Text("Choose image from"),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                ),
                onPressed: () {
                  Get.back();
                  _onCamera();
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                ),
                onPressed: () {
                  Get.back();
                  _onGallery();
                },
                child: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  doSave() async {
    var data = {
      "nis": nis,
      "nama_siswa": namaSiswa,
      "tempat_lahir": tempatLahir,
      "alamat": alamat,
      "hp": hp,
      "image_url": image!.path,
      "created_by": "system",
      "created_date": created_date.toString(),
    };
    DataBaseHelper.insert("mst_siswa", data).then((value) {
      if (value > 0) {
        Get.snackbar(
          "Success",
          "Simpan data berhasil",
          backgroundColor: Colors.white,
          colorText: Colors.blue[900],
        );
        Get.off(const SiswaView());
      } else {
        Get.snackbar(
          "Sorry",
          "Simpan data gagal",
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
      }
    });
  }

  doUpdate(String id) async {
    var data = {
      "nis": nis,
      "nama_siswa": namaSiswa,
      "tempat_lahir": tempatLahir,
      "alamat": alamat,
      "hp": hp,
      "image_url": image == null ? foto : image!.path,
      "created_by": "system",
      "created_date": created_date.toString(),
    };
    DataBaseHelper.update("mst_siswa", data, "id=?", id).then((value) {
      if (value > 0) {
        Get.snackbar(
          "Success",
          "Update data berhasil",
          backgroundColor: Colors.white,
          colorText: Colors.blue[900],
        );
        Get.off(const SiswaView());
      } else {
        Get.snackbar(
          "Sorry",
          "Update data gagal",
          backgroundColor: Colors.white,
          colorText: Colors.red[900],
        );
      }
    });
  }
}
