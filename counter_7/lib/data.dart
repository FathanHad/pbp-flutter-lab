import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Budget'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: const Text("counter_7"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyDataPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: Tampil.Contain.length,
            itemBuilder: (context, index) {
              final item = Tampil.Contain[index];
              return ListTile(
                title: Text(item.namaJudul, style: GoogleFonts.pridi(fontSize: 20)),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.nominal.toString(), style: GoogleFonts.pridi(fontSize: 20)),
                      Text(item.jenis, style: GoogleFonts.pridi(fontSize: 20))
                    ]),
              );
            }));
  }
}
