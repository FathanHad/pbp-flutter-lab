# TUGAS 7 PBP

## Definisi *stateless* widget dan *stateful* widget dan perbedaanya
*Stateless* widget adalah widget yang tampilannya tidak akan berubah atau statis. Contoh dari *stateless* widget, yaitu Icon, Icon Button, Text, dll.

*Stateful* widget bersifat dinamis, user dapat berinteraksi dengannya. Contohnya, suatu widget dapat berubah tampilan sebagai response dari event yang di-*trigger* oleh interaksi user atau saat menerima data. Contoh dari stateful widget, yaitu CheckBox, Radio, Slider, Form, TextField, dll

## Sebutkan widget yang dipakai pada tugas ini
Saya menggunakan beberapa widget, yaitu:
- `Column()`, untuk menata elemen secara vertikal
- `Row()`, untuk menata elemen secara horizontal
- `Text()`, untuk memunculkan teks
- `Padding()`, untuk menambah padding (mengatur posisi elemen)
- `FloatingActionButton()`, untuk menambahkan tombol
- `Center()`, untuk menata posisi child di tengah

## Fungsi dari `setState()` dan variabel yang terdampak oleh fungsi tersebut
Fungsi ini akan mengubah data yang ada pada program dan menampilkan efeknya di layar. Contoh ketika menekan tombol *increment* dan *decrement*, maka nilai dari variabel `_counter` akan berubah dan layar akan menunjukkan nilai yang telah berubah. Fungsi ini membuat elemen semakin dinamis, sehingga menjadi lebih interaktif.

## Perbedaan antara `const` dan `final`
*Keyword* `const` mengharuskan variabel harus dinialisasi pada saat kompilasi, nilai bersifat konstan dan secara langsung / eksplisit sehingga pada saat kompilasi variabel const sudah memiliki nilai, sedangkan `final` tidak mengharuskan variabel memiliki nilai secara langsung / eskplisit pada saat kompilasi.

## Implementasi Checklist
1. Membuat program Flutter bernama counter_7 dengan perintah flutter create counter_7 pada terminal directory untuk proyek ini.
2. Membuat fungsi untuk men-decrement counter sebagai berikut:
```js
 void _decrementCounter() {
    setState(() {
      if(_counter > 0){
      _counter--;
      }
    });
  }
```
3. Membuat fungsi untuk display Genap/Ganjil sebagai berikut:
```js
 oddOrEven(){
    if(_counter % 2 == 0){
      return  Text("GENAP", style: GoogleFonts.pridi(textStyle: const TextStyle(fontSize: 50, color: Colors.red)));
    }
    else{
      return  Text("GANJIL", style: GoogleFonts.pridi(textStyle: const TextStyle(fontSize: 50, color: Colors.blue)));
    }
  }
```
4. Membuat dan mengatur tampilan button di layar
```js
    floatingActionButton: Padding(
        padding : const EdgeInsets.only(right: 5.0, left: 35.0, bottom: 15.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            if(_counter > 0)
            FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            ),

            FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            ), 
          ],
        ), 
      ),
```
