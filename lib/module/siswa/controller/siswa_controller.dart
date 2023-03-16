import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import 'package:get/get.dart';
import '../../../service/databaseHelper.dart';
import '../view/siswa_view.dart';

class SiswaController extends State<SiswaView> implements MvcController {
  static late SiswaController instance;
  late SiswaView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getData();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List listSiswa = [];
  String? search;

  getData() async {
    DataBaseHelper.getAll("mst_siswa").then(
      (value) {
        listSiswa = [];
        if (value.isEmpty) {
          Get.snackbar(
            "Maaf",
            "Data tidak ada",
            backgroundColor: Colors.white,
            colorText: Colors.red,
          );
        } else {
          listSiswa = value;
          setState(() {});
        }
      },
    );
  }

  getWhere(String nama_siswa) async {
    listSiswa = [];
    DataBaseHelper.getWhere("mst_siswa", "nama_siswa LIKE ?", '%$nama_siswa%')
        .then((value) {
      listSiswa = value;
      setState(() {});
    });
  }

  deleteData(String id) async {
    DataBaseHelper.deleteWhere("mst_siswa", "id=?", id).then((value) {
      Get.snackbar(
        "Success",
        "Delete data berhasil",
        backgroundColor: Colors.white,
        colorText: Colors.blue[800],
      );
      getData();
    });
  }
}
