import 'package:flutter/material.dart';
import 'package:latihansqflite/adddata.dart';
import 'package:latihansqflite/databasehelper.dart';
import 'package:latihansqflite/model.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({Key? key}) : super(key: key);

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  late DatabaseHelper db;
  late List<ModelMahasiswa> itemList;

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
    itemList = [];
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<dynamic>? data = await db.getAllMahasiswa();
    if (data != null) {
      List<ModelMahasiswa> mahasiswaList = data.map((e) => ModelMahasiswa.fromMap(e)).toList();
      setState(() {
        itemList = mahasiswaList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Mahasiswa"),
          backgroundColor: Colors.green,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddMahasiswa()),
                ).then((_) => _fetchData());
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            ModelMahasiswa data = itemList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Card(
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddMahasiswa(data: data),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Anda yakin menghapus data ${data.nama}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                db.deleteMahasiswa(data.id).then((_) {
                                  _fetchData();
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text("Yes"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  title: Text(data.nama),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No. BP: ${data.noBP}"),
                      Text("No. HP: ${data.noHP}"),
                      Text("Email: ${data.email}"),
                      Text("Alamat: ${data.alamat}"),
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
