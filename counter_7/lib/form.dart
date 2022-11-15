import 'package:counter_7/data.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

class FormPage extends StatefulWidget {
    const FormPage({super.key});

    @override
    State<FormPage> createState() => _FormPageState();
}

class BudgetData {
  late String judul;
  late int nominal;
  late String jenis;
  late DateTime tanggal;

  BudgetData (
    {required this.judul, required this.nominal, required this.jenis, required this.tanggal}
  );
}

List<BudgetData> budgetList = [];

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  int? nominal;
  String? jenis;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  DateTime tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Tambah Budget'),
      ),
      drawer: const PageDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Beli Makan',
                      labelText: 'Judul',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value==null || value.isEmpty) {
                        return 'Isi Judul';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '15000',
                      labelText: 'Nominal',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        if (value != '') {
                          nominal = int.parse(value!);
                        }
                      });
                    },
                    validator: (String? value) {
                      if (value==null || value.isEmpty) {
                        return 'Isi Nominal';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: Text(tanggal.toString().substring(0, 10)),
                  leading: TextButton.icon(
                    onPressed: () {
                      showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(2021), 
                        lastDate: DateTime(2023)
                      ).then((tanggal) {
                        setState(() {
                          this.tanggal = tanggal!;
                        });
                      });
                    },
                    icon: const Icon(Icons.calendar_month_outlined), 
                    label: const Text('Masukkan Tanggal'),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: listJenis.map((String jenisItem) {
                      return DropdownMenuItem(
                        value: jenisItem,
                        child: Text(jenisItem),
                      );
                    }).toList(),
                    hint: const SizedBox(
                      width: 150, //and here
                      child: Text(
                        "Pilih Jenis",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onChanged: (String? jenisNew) {
                      setState(() {
                        jenis = jenisNew!;
                      });
                    },
                    value: jenis,
                    icon: const Icon(Icons.arrow_drop_down),
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.blue,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (jenis==null || jenis=='') {
                          showDialog(
                            context: context, 
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                elevation: 10,
                                child: ListView(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(child: Text('Pilih jenis!'),),
                                    const SizedBox(height: 25,),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }, 
                                      child: const Text('Back'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        else {
                          onPressed(context);
                        }
                      }
                    },
                    child: const Text('Simpan', style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPressed(BuildContext context) {
    var data = BudgetData(judul: _judul!, nominal: nominal!, jenis: jenis!, tanggal: tanggal);
    budgetList.add(data);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DataPage()),
    );
  }
}