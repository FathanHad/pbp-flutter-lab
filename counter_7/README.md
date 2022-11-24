# TUGAS 7 PBP

## Definisi _stateless_ widget dan _stateful_ widget dan perbedaanya

_Stateless_ widget adalah widget yang tampilannya tidak akan berubah atau statis. Contoh dari _stateless_ widget, yaitu Icon, Icon Button, Text, dll.

_Stateful_ widget bersifat dinamis, user dapat berinteraksi dengannya. Contohnya, suatu widget dapat berubah tampilan sebagai response dari event yang di-_trigger_ oleh interaksi user atau saat menerima data. Contoh dari stateful widget, yaitu CheckBox, Radio, Slider, Form, TextField, dll

## Sebutkan widget yang dipakai pada tugas ini

Saya menggunakan beberapa widget, yaitu:

- `Column()`, untuk menata elemen secara vertikal
- `Row()`, untuk menata elemen secara horizontal
- `Text()`, untuk memunculkan teks
- `Padding()`, untuk menambah padding (mengatur posisi elemen)
- `FloatingActionButton()`, untuk menambahkan tombol
- `Center()`, untuk menata posisi child di tengah

## Fungsi dari `setState()` dan variabel yang terdampak oleh fungsi tersebut

Fungsi ini akan mengubah data yang ada pada program dan menampilkan efeknya di layar. Contoh ketika menekan tombol _increment_ dan _decrement_, maka nilai dari variabel `_counter` akan berubah dan layar akan menunjukkan nilai yang telah berubah. Fungsi ini membuat elemen semakin dinamis, sehingga menjadi lebih interaktif.

## Perbedaan antara `const` dan `final`

_Keyword_ `const` mengharuskan variabel harus dinialisasi pada saat kompilasi, nilai bersifat konstan dan secara langsung / eksplisit sehingga pada saat kompilasi variabel const sudah memiliki nilai, sedangkan `final` tidak mengharuskan variabel memiliki nilai secara langsung / eskplisit pada saat kompilasi.

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

# TUGAS 8 PBP

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`

Widget Navigator bekerja seperti stack yang berbentuk seperti tumpukan screen.

Navigator.push() digunakan untuk menambahkan route lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.

Navigator.pushReplacement juga digunakan untuk menambahkan route lain, tetapi mengganti screen teratas dalam stack dengan screen yang baru.

untuk lebih detailnya dapat cek [disini](https://www.technicalfeeder.com/2021/11/flutter-page-transition/)

## Sebutkan widget yang dipakai pada tugas ini dan jelaskan fungsinya

Kurang lebih sama seperti tugas 7, beberapa tambahan widget baru seperti:

- `Drawer()` berfungsi sebagai navigasi untuk berpindah ke page lain
- `ListTile()` berfungsi sebagai container
- `DropdownButton()` berfungsi untuk menampilkan menu dropdown untuk jenis pengisian form
- `TextFormField` berfungsi sebagai kolom submisi dengan format text dalam form
- dll

## Sebutkan jenis event yang ada pada flutter

- `onTap`
- `onDoubleTap`
- `onLongPress`
- `onScaleStart`
- `onPressed`
- dll

## Cara kerja Navigator dalam mengganti halaman pada Flutter

src : https://www.technicalfeeder.com/2021/11/flutter-page-transition/

Saat ada pemanggilan method `push()`, screen akan dimasukkan ke dalam stack dan akan tampil di layar, lalu saat ada pemanggilan method `pop()`, screen yang terakhir kali dimasukkan ke dalam stack akan dikeluarkan dan pada layar akan tampil screen yang di push sebelumnya.

## Implementasi Checklist

1. Buat file `form.dart` dan `data.dart`, lalu tambahkan import yang diperlukan pada semua file.
2. Buat Drawer

```js
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
```

3. pada `form.dart`, tambahkan widget yang diperlukan, seperti textfield, dropdown, dan button.
4. buat dua class untuk mengambil input yang diberikan yang nantinya akan dimunculkan di page Data Budget

```js
class Budget {
  String namaJudul;
  int nominal;
  String jenis;

  Budget(this.namaJudul, this.nominal, this.jenis);
}

class Tampil {
  static List<Budget> Contain = <Budget>[];
}
```

jangan lupa untuk melakukan add untuk menyimpan inputannya

```js
Tampil.Contain.add(Budget(_namaJudul, nominal, jenis));
```

5. Munculkan data inputannya pada page Data Budget

```js
body: ListView.builder(
        itemCount: Tampil.Contain.length,
        itemBuilder: (context, index) {
          final item = Tampil.Contain[index];
          return ListTile(
            title: Text(item.namaJudul),
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.nominal.toString()),
                  Text(item.jenis)
                ]),
          );
        })
```

# TUGAS 9 PBP

## Apakah pengambilan data JSON dapat dilakukan tanpa membuat model terlebih dahulu? Jika iya, apakah lebih baik daripada membuat model sebelum pengambilan data JSON?

Flutter mempunyai library bawaan yaitu code generation library atau lebih tepatnya memakai `json_serializable` yang memungkinkan kita melakukan fetch data dari tipe data json ke flutter tanpa harus membuat model. Penggunaan library ini cocok untuk men-*convert* data json dalam skala menengah ke besar. Namun, jika data yang diolah masih dalam skala kecil, pemakaian model lebih disarankan.

## Widget yang dipakai dan jelaskan fungsinya
- `Text`, `RichText`, `TextSpan` : memodifikasi weight dan ukuran font dari suatu String
- `FutureBuilder` : mengolah data hasil konversi dari json
- `Align`, `Column`, `Padding` : mengatur layout
- `ListView.Builder` : membuat array widget yang dapat di-scroll.

## Mekanisme Pengambilan data dari json sampai ditampilkan pada flutter

1. Menambahkan dependensi HTTP ke proyek agar dapat melakukan pertukaran data melalui HTTP request
2. Membuat model sesuai response data yang diterima dari web service
3. Membuat HTTP request ke web service menggunakan dependensi HTTP
4. Melakukan konversi dari objek yang didapat ke model yang sudah dibuat
5. Menampilkan data yang telah dikonversi dengan widget `FutureBuilder`

## Implementasi Checklist
1. Melakukan refactor file. Proses ini dilakukan untuk meningkatkan keterbacaan, mengurangi kompleksitas kode, dan memudahkan proses maintenance ke depannya.
2. Buat model menggunakan website Quicktype dengan menggunakan data json dari tugas 3, lalu masukkan kode ke dalam `model/mywatchlist.dart`
3. Melakukan `flutter pub add http` untuk menambahkan package http beserta import `<uses-permission android:name="android.permission.INTERNET" />` pada direktori `android/app/src/main/AndroidManifest.xml`
4. Menampilkan judul film menggunakan FutureBuilder dan menyimpan class Field untuk diproses pada page detail
5. Membuat TextButton pada judul. Jika user menekannya maka akan ternavigasi ke page detail
6. Mengambil field yang sudah disimpan dengan getter dan menampilkan informasi detail mengenai film yang ditekan. Tambahkan juga tombol back agar dapat ternavigasi kembali ke page mywatchlist.