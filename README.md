# Tugas 7 PBP

Nama: Wedens Elma Malau

NPM: 2106751165


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
