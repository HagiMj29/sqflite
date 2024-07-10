import 'package:flutter/material.dart';
import 'package:latihansqflite/databasehelper.dart';
import 'package:latihansqflite/listdata.dart';
import 'package:latihansqflite/model.dart';

class AddMahasiswa extends StatefulWidget {
  final ModelMahasiswa? data;

  const AddMahasiswa({Key? key, this.data}) : super(key: key);

  @override
  State<AddMahasiswa> createState() => _AddMahasiswaState();
}

class _AddMahasiswaState extends State<AddMahasiswa> {
  DatabaseHelper db = DatabaseHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data?.nama);
    bpController = TextEditingController(text: widget.data?.noBP);
    hpController = TextEditingController(text: widget.data?.noHP);
    emailController = TextEditingController(text: widget.data?.email);
    addressController = TextEditingController(text: widget.data?.alamat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data?.id != null ? "Update Mahasiswa" : "Add Mahasiswa"),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Nama"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: bpController,
                decoration: const InputDecoration(hintText: "Nomor BP"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: hpController,
                decoration: const InputDecoration(hintText: "Nomor HP"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(hintText: "Alamat"),
              ),
              const SizedBox(
                height: 25,
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.green,
                height: 45,
                onPressed: () {
                  if (widget.data?.id != null) {
                    db.updateMahasiswa(widget.data!.id, ModelMahasiswa(
                      nameController.text,
                      bpController.text,
                      hpController.text,
                      emailController.text,
                      addressController.text,
                    )).then((value) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const ListMahasiswa()),
                            (route) => false,
                      );
                    });
                  } else {
                    db.saveMahasiswa(ModelMahasiswa(
                      nameController.text,
                      bpController.text,
                      hpController.text,
                      emailController.text,
                      addressController.text,
                    )).then((_) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const ListMahasiswa()),
                            (route) => false,
                      );
                    });
                  }
                },
                child: Text(widget.data?.id != null ? "EDIT" : "SIMPAN"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
