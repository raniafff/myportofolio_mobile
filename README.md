# My Portofolio Mobile

Aplikasi portofolio pribadi berbasis mobile multiplatform yang dibangun menggunakan **Flutter** dan **Dart**. Proyek ini merupakan bagian dari mata kuliah Pemrograman Berbasis Platform (CSGE602022) Fasilkom Universitas Indonesia.

---

## Identitas Pengembang
- **Nama:** Rania Firsa
- **NPM:** 2506616693
- **Kelas:** PBP C

---

## Tugas 7: Basic Flutter

### 1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
Di dalam Flutter, antarmuka pengguna (UI) dibangun sepenuhnya menggunakan konsep **widget**, di mana hampir setiap elemen (mulai dari struktur tata letak, padding, teks, tombol, hingga styling) adalah sebuah widget.

**Widget Tree** adalah struktur pohon hierarkis yang merepresentasikan susunan komponen antarmuka aplikasi. Hubungan induk-anak (*parent-child*) bekerja dengan aturan:
- **Parent widget** bertanggung jawab mengatur tata letak, batasan dimensi (*constraints* seperti ukuran maksimum/minimum), posisi, atau memberikan konfigurasi gaya kepada widget anak di bawahnya.
- **Child widget** menerima batasan (*constraints*) dari parent-nya, menentukan ukuran dirinya sendiri berdasarkan batasan tersebut, dan melaporkannya kembali ke parent.
- Data dan konfigurasi umumnya mengalir ke bawah (*downwards*) dari parent ke child melalui konstruktor atau `InheritedWidget`, sedangkan peristiwa (*event/callback*) dikirimkan ke atas (*upwards*).

Contoh pada aplikasi ini:
`MaterialApp` (Root) ➔ `MyHomePage` ➔ `Scaffold` ➔ `SingleChildScrollView` ➔ `Padding` ➔ `Column` ➔ `Row` ➔ `InfoCard`.

---

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
Berikut adalah daftar widget yang digunakan pada proyek ini:
1. **`MaterialApp`**: Widget pembungkus utama (*root*) yang menginisialisasi aplikasi bergaya Material Design, menyediakan tema global, routing, dan navigasi.
2. **`Scaffold`**: Menyediakan kerangka dasar tata letak layar Material Design standar (seperti `appBar` dan `body`).
3. **`AppBar`**: Menampilkan bilah navigasi/judul aplikasi pada bagian atas layar.
4. **`Text`**: Menampilkan string teks dengan konfigurasi tipografi tertentu (`style`, `fontWeight`, `fontSize`).
5. **`SingleChildScrollView`**: Membungkus konten agar halaman dapat digulir (*scrollable*) jika dimensi layar perangkat lebih kecil dari tinggi konten, menghindari *overflow error*.
6. **`Padding`**: Memberikan jarak kosong (*insets*) di sekeliling widget anaknya.
7. **`Column`**: Menyusun kumpulan widget anaknya secara vertikal (atas ke bawah).
8. **`Row`**: Menyusun kumpulan widget anaknya secara horizontal (kiri ke kanan).
9. **`SizedBox`**: Memberikan jarak tetap (*spacing*) antar elemen atau mengatur dimensi tertentu secara presisi.
10. **`Center`**: Memposisikan widget anak tepat di tengah ruang yang tersedia.
11. **`GridView.count`**: Menata elemen anak ke dalam format grid (tabel berulang) dengan jumlah kolom tetap (`crossAxisCount: 3`).
12. **`Card`**: Menampilkan bidang kartu berpanel dengan sudut melengkung dan efek bayangan (*elevation*).
13. **`Container`**: Komponen fleksibel yang menggabungkan kemampuan pengaturan lebar, tinggi, padding, dan styling.
14. **`Material`**: Komponen dasar Material Design yang menyediakan efek visual warna permukaan dan *border radius*.
15. **`InkWell`**: Memberikan respons sentuhan dengan efek animasi riak air (*ripple effect*) ketika kartu ditekan (`onTap`).
16. **`Icon`**: Menampilkan ikon visual grafis bawaan Material Icons (seperti `Icons.folder`, `Icons.add`, `Icons.logout`).

---

### 3. Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
`MaterialApp` adalah widget tingkat atas (*top-level widget*) yang mengonfigurasi komponen-komponen dasar yang dibutuhkan untuk menjalankan aplikasi yang mengikuti panduan **Material Design**.

**Fungsi utama `MaterialApp`:**
- **Theming**: Mendukung pengaturan tema global aplikasi (`ThemeData`, `ColorScheme`), seperti penentuan warna primer dan sekunder.
- **Navigasi & Routing**: Menyediakan sistem `Navigator` untuk berpindah antar halaman/rute.
- **Localization**: Mengatur bahasa, arah teks (LTR/RTL), dan formatting lokal.
- **Overlay & Media Query**: Menyediakan lapisan `Overlay` yang memungkinkan elemen seperti `SnackBar`, `Dialog`, dan `BottomSheet` muncul di atas layar.

Widget ini digunakan sebagai *root widget* karena sebagian besar widget Material (seperti `Scaffold`, `AppBar`, `Theme.of(context)`) membutuhkan dependensi dan konteks yang disediakan secara langsung oleh `MaterialApp`.

---

### 4. Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?
- **`StatelessWidget`**:
  - Bersifat statis (*immutable*). Konfigurasi widget ini dibuat sekali saat diinisialisasi dan tidak dapat berubah sepanjang siklus hidupnya.
  - Tidak memiliki objek `State` internal. Jika data masukan berubah dari parent, widget akan di-build ulang secara menyeluruh.
  - **Kapan digunakan:** Cocok untuk antarmuka yang murni hanya menampilkan data atau tidak memiliki perubahan internal yang dipicu oleh interaksi pengguna (misalnya teks statis, ikon, kartu profil statis, atau tombol yang hanya memicu aksi eksternal).
  
- **`StatefulWidget`**:
  - Bersifat dinamis (*mutable*). Widget ini memiliki objek `State` yang dapat menyimpan dan melacak perubahan data selama widget berada di layar.
  - Memiliki metode `setState()` untuk memberi tahu framework agar me-render ulang UI ketika nilai variabel di dalam `State` berubah.
  - **Kapan digunakan:** Digunakan ketika tampilan UI perlu berubah secara dinamis berdasarkan interaksi pengguna atau aliran data asynchronous (misalnya form input, checkbox, slider, animasi, timer, atau keranjang belanja).

---

### 5. Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?
`BuildContext` adalah sebuah objek penanda lokasi (*handle*) dari sebuah widget di dalam hierarki **Widget Tree**.

**Mengapa penting:**
- Setiap widget memiliki `BuildContext` masing-masing yang unik. Konteks ini memberi tahu Flutter di mana widget tersebut berada, siapa induknya (*parent*), dan apa saja widget di sekitarnya.
- Digunakan untuk mencari dan mengakses data konfigurasi atau tema dari leluhurnya (*ancestor*) menggunakan metode `of(context)`, seperti `Theme.of(context)`, `MediaQuery.of(context)`, atau `ScaffoldMessenger.of(context)`.

**Penggunaannya di dalam metode `build`:**
Parameter `BuildContext context` dioper ke dalam metode `Widget build(BuildContext context)` agar widget tahu posisinya saat ini ketika dirender. Contohnya pada proyek ini:
- `MediaQuery.of(context).size.width`: Untuk menghitung lebar layar saat ini agar kartu `InfoCard` responsif.
- `Theme.of(context).colorScheme.primary`: Untuk mengambil warna tema aplikasi yang didefinisikan di `MaterialApp`.
- `ScaffoldMessenger.of(context).showSnackBar(...)`: Untuk menemukan widget `Scaffold` terdekat dan memunculkan pop-up `SnackBar`.

---

### 6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?
- **Hot Reload**:
  - Memasukkan perubahan kode sumber (*source code*) terbaru langsung ke dalam Dart Virtual Machine (Dart VM) yang sedang berjalan tanpa menghancurkan dan mengulang *state* aplikasi saat ini.
  - Prosesnya sangat cepat (hitungan milidetik). Sangat ideal saat mendesain UI, mengubah warna, teks, atau layout.
  
- **Hot Restart**:
  - Menghancurkan seluruh *state* aplikasi yang ada, menginisialisasi ulang seluruh variabel aplikasi dari awal, dan memanggil kembali fungsi `main()`.
  - Lebih cepat daripada kompilasi ulang penuh (*full rebuild*), tetapi semua kondisi/state sementara yang sedang berjalan akan di-reset ke nilai default.

**Kapan hot reload tidak bisa digunakan dan harus hot restart / full restart:**
1. **Mengubah fungsi `main()`**: Karena hot reload tidak mengeksekusi ulang `main()`.
2. **Mengubah inisialisasi state awal / variabel global / konstruktor**: Variabel yang sudah terinisialisasi di memori tidak akan di-reset oleh hot reload.
3. **Mengubah `StatelessWidget` menjadi `StatefulWidget`** (atau sebaliknya).
4. **Menambahkan dependensi / pustaka baru di `pubspec.yaml`**: Memerlukan *full restart* agar package baru terkompilasi.
5. **Mengubah kode native (Android / iOS)**: Seperti konfigurasi AndroidManifest atau Gradle, memerlukan kompilasi ulang penuh (*full restart*).

---

### Langkah-langkah Implementasi Checklist
1. Mengubah berkas `lib/menu.dart` dengan menambahkan properti `Color color` pada class `ItemHomepage` agar setiap kartu tombol memiliki warna yang unik (Indigo, Amber, dan Red).
2. Memperbarui widget `ItemCard` agar menggunakan `item.color` sebagai warna latar belakang `Material`.
3. Memastikan `InkWell` memunculkan `SnackBar` menggunakan `ScaffoldMessenger.of(context)` dengan teks pesan *"Kamu telah menekan tombol [Nama Tombol]!"*.
4. Mengisi identitas diri (Nama, NPM, Kelas) pada `InfoCard`.
5. Menjalankan `flutter analyze` untuk memastikan kode bebas dari peringatan sintaksis (*No issues found!*).
6. Menuliskan dokumentasi refleksi pada `README.md` dan melakukan push ke repositori GitHub.