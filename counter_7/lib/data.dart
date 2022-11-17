import 'package:counter_7/drawer.dart';
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
        drawer: Hamburger(),
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
                      Text("Tanggal : "+item.tanggal.toString().substring(0,10), style: GoogleFonts.pridi(fontSize: 20)),
                      Text(item.jenis, style: GoogleFonts.pridi(fontSize: 20)), 
                    ]),
              );
            }));
  }
}
