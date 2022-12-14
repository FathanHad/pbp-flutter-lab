import 'package:counter_7/drawer/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/pages/data.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Budget {
  String namaJudul;
  int nominal;
  String jenis;
  DateTime tanggal;

  Budget(this.namaJudul, this.nominal, this.jenis, this.tanggal);
}

class Tampil {
  static List<Budget> Contain = <Budget>[];
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaJudul = "";
  int nominal = 0;
  String jenis = 'Pemasukan';
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  DateTime tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      drawer: Hamburger(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Contoh: Di Suatu Hari nan Cerah",
                        labelText: "Judul",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaJudul = value!;
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaJudul = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        hintText: "Contoh: 2 ETH",
                        labelText: "Nominal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: DropdownButton(
                    value: jenis,
                    icon: const Icon(Icons.arrow_downward),
                    items: listJenis.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: OutlinedButton.icon(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: tanggal,
                                firstDate: DateTime(1945),
                                lastDate: DateTime(2077))
                            .then((selectedDate) {
                          setState(() {
                            if (selectedDate != null) {
                              tanggal = selectedDate;
                            }
                          });
                        });
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                      icon: const Icon(Icons.date_range),
                      label: const Text("Pilih Tanggal")),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: SizedBox(
                      height: 40,
                      width: 85,
                      child: TextButton(
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding: const EdgeInsets.all(20.0),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                            child: Text(
                                                'Berhasil Menambahkan Data !!',
                                                style: GoogleFonts.pridi(
                                                    fontSize: 27))),
                                        SizedBox(height: 40),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Kembali",
                                              style: GoogleFonts.pridi(
                                                  fontSize: 20)),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                            Tampil.Contain.add(
                                Budget(_namaJudul, nominal, jenis, tanggal));
                          }
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
