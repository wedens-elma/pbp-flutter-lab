# Tugas 7 PBP

Nama: Wedens Elma Malau

NPM: 2106751165

[README untuk Tugas 8](https://github.com/wedens-elma/pbp-flutter-lab/blob/main/README.md#tugas-8-pbp)

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateful widget adalah widget yang dapat berubah sesuai trigger ketika kita berinteraksi dengannya, sedangkan stateless widget tidak dapat berubah. Contoh dari stateful widget adalah Radio, TextField, dan CheckBox. Sementara itu, contoh dari stateless widget adalah Text dan Icon.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

* Icon: add untuk tombol tambah (+) dan remove untuk tombol kurang (-)
* Text: untuk menampilkan angka counter, "GANJIL", dan "GENAP"
* Padding: untuk membatasi posisi row tempat tombol berada, agar tidak terpotong karena terlalu mepet ke kiri
* Row: untuk menampung button decrement dan increment dalam satu baris agar rapi
* Visibility: untuk menentukan kapan child yang berada di dalamnya (dalam hal ini FloatingActionButton) dapat muncul
* Column: sebuah layout widget yang menyusun child-nya secara vertikal
* Center: layout widget yang memposisikan child-nya di tengah

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Objek State ada pada setiap StatefulWidget. setState() berfungsi untuk memberitahu widget bahwa ada yang berubah dari State. Dengan demikian, aplikasi akan memuat ulang widget dan mengupdate tampilan padad UI dengan nilai baru yang berubah. setState() dapat mengubah variabel selain const dan final. Dalam Lab 7 ini, variabel yang terdampak oleh setState() adalah variabel _counter.

## Jelaskan perbedaan antara const dengan final.

Variabel final digunakan untuk variable immutable (tidak bisa diubah nilainya), yang nilainya dapat sudah ataupun belum diketahui ketika kompilasi berjalan. Variabel final diinialisasi pada saat pertama kali digunakan, hanya disetel sekali, dan akan diketahui pada saat run-time.

Sementara itu, variabel const digunakan untuk variable immutable (tidak bisa diubah nilainya), yang nilainya harus sudah diketahui ketika kompilasi berjalan. Variabel final harus sudah diberikan nilai ketika pertama kali dideklarasikan.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Pertama-tama, saya membuat repository baru bernama pbp-flutter-lab di github. Lalu, saya clone repository tersebut ke local dengan cara `git clone https://github.com/wedens-elma/pbp-flutter-lab.git`

2. Setelah diclone, saya membuka repository tersebut dengan `cd pbp-flutter-lab`, lalu membuat program flutter baru yang bernama counter_7 dengan mengetikkan `flutter create counter_7` di cmd

3. Setelah dibuat, app tersebut dibuka di VSCode. Pada file di lib/main.dart, saya menambahkan suatu fungsi bernama `_decrementCounter()` yang berfungsi untuk menghandle tombol decrement (-).

4. Tulisan di tengah diganti dengan "GANJIL" atau "GENAP", sesuai dengan nilai pada _counter. Saya memanfaatkan widget Text dengan cara sebagai berikut:
```_counter % 2 == 1
     ? const Text('GANJIL',
         style: TextStyle(color: Colors.blue),
     )
     : const Text('GENAP',
         style: TextStyle(color: Colors.red)
     ),
```

5. Saya menambahkan satu tombol lagi di baris yang sama dengan tombol (+) yang sudah tersedia. Karena mereka berada pada satu baris rata, saya memasukkan kedua FloatingActionButton ke dalam children dari Row. Namun, hanya ini saja akan membuat tombol (-) yang di sebelah kiri terpotong oleh layar. Oleh karena itu, saya menambahkan Padding kiri dengan EdgeInsets sebanyak 35 pixel. Untuk tombol (-), dihide dengan Visibility, yaitu hanya visible ketika counter > 0.

6. Title dari HomePage diubah menjadi "Program Counter"

7. Setelah dicoba dengan melakukan flutter run dan sudah berhasil, saya membuka directory repo dan melakukan git add, commit, dan push.


# Tugas 8 PBP

Nama: Wedens Elma Malau

NPM: 2106751165

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Keduanya berfungsi untuk mengepush route baru ke `Navigator`, dengan cara kerja yang mirip dengan stack. Perbedaannya adalah `Navigator.pushReplacement` dapat mengganti route sebelumnya dengan route lain setelah route baru selesai diload. Contohnya adalah ketika membuka suatu halaman yang membutuhkan login terlebih dahulu, `Navigator.pushReplacement` dapat digunakan untuk mencegah ia kembali ke halaman login ketika menekan tombol back, melainkan dapat diarahkan ke halaman dashboard atau homepage.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Saya menambahkan widget-widget berikut untuk Tugas 8:

* `Form`: sebagai container dari form input
* `SingleChildScrollView`: sebagai wadah yang membuat sebuah widget dapat discroll, sehingga menyusun widget ke bawah, namun hanya boleh mempunyai satu child, sehingga jika ingin menyusun beberapa widget harus dimasukkan ke dalam container lain, contohnya Column.
* `Align`: widget untuk mengatur posisi widget di dalamnya
* `Navigator`: untuk mengatur route dari halaman-halaman screen

## Sebutkan jenis-jenis event yang ada pada Flutter.
Beberapa dari event pada Flutter yaitu `onPressed`, `onChanged`, `onSaved`, dan `onTap`. Pada program minggu ini, saya menggunakan `onPressed`, `onChanged`, dan `onSaved`.

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator mempunyai fungsi push yang bekerja mirip seperti stack. Jika ada perintah `Navigator.push`, maka route yang dimasukkan akan ditampilkan pada layer teratas dari layar. Untuk menutup layer teratas dapat dilakukan dengan `Navigator.pop`, sehingga screen akan menampilkan layer di bawahnya.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

Pertama, saya membuat sebuah drawer pada `main.dart`. Drawer ini berisi tiga tombol navigasi ke 3 page berbeda. Setelah mencoba menjalankan aplikasinya dan berhasil, saya memindahkan drawer dari `main.dart` ke sebuah file baru bernama `drawer.dart` untuk memenuhi checklist untuk bonus.

Setelah menyelesaikan drawer, saya membuat sebuah file lain bernama `form.dart`, yang akan dimasukkan ke routing pada drawere bagian "Tambah Budget". Pada file ini, saya membuat sebuah class untuk menyimpan data budget dan sebuah class untuk state dari halaman. Halaman form ini berisi `TextFormField` untuk nama budget dan nominal, `DateTime` untuk tanggal, dan `DropDown` untuk jenis budget. Terdapat juga sebuah `TextButton` untuk menyimpan input. Untuk menyimpan input, saya membuat sebuah fungsi `onPressed(context)` yang akan meng-construct sebuah objek dari `BudgetData`, yang nantinya akan dimasukkan ke dalam `List<BudgetData>` bernama budgetList.

Untuk halaman data, saya memasukkan masing-masing data budget ke dalam `Material` yang dibentuk seperti card dengan membuat shadow dan elevation, disusun ke dalam sebuah `ListView`. Judul dan nominal budget diletakkan di sebelah kiri, lalu jenis dan tanggal diletakkan di dalam sebuah column trailing, sehingga tampil di sebelah kanan.
