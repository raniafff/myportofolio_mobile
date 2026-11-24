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


---

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### 1. Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`!
Flutter mengelola riwayat navigasi dan halaman (*routes*) menggunakan struktur data tumpukan (**stack**). Ketiga metode ini memiliki perbedaan mendasar dalam memanipulasi *route stack*:
- **`Navigator.push()`**:
  - Menambahkan (*push*) sebuah *route* baru ke bagian paling atas tumpukan (*top of the stack*).
  - Halaman sebelumnya tetap tersimpan di dalam stack tepat di bawah halaman baru.
  - Pengguna dapat kembali ke halaman sebelumnya menggunakan tombol *Back* pada *AppBar* atau tombol kembali bawaan perangkat/sistem operasi.
  - **Penggunaan:** Digunakan ketika pengguna membuka halaman detail atau formulir dari menu utama yang alur alaminya mengharapkan pengguna bisa kembali ke halaman asal (misalnya tombol "Tambah Proyek" dan "Tambah Edukasi").
- **`Navigator.pushReplacement()`**:
  - Menggantikan (*replace*) rute yang sedang aktif di puncak stack dengan rute yang baru tanpa menambah kedalaman stack.
  - Rute lama dibuang (*popped*) dan langsung digantikan oleh rute baru.
  - Jika pengguna menekan tombol *Back*, mereka tidak akan kembali ke halaman yang baru saja digantikan, melainkan ke halaman di bawahnya (atau keluar dari aplikasi jika stack hanya bersisa satu rute).
  - **Penggunaan:** Umumnya digunakan pada menu *Drawer* atau alur login/splash screen ke dashboard, agar riwayat navigasi tidak menumpuk halaman yang berulang.
- **`Navigator.pop()`**:
  - Menghapus (*pop*) rute yang sedang berada di puncak stack, sehingga aplikasi kembali menampilkan rute yang berada tepat di bawahnya.
  - **Penggunaan:** Digunakan untuk menutup pop-up dialog (`AlertDialog`), *modal bottom sheet*, atau kembali dari halaman formulir ke halaman sebelumnya secara terprogram setelah aksi selesai.

---

### 2. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi *Home* di drawer membawa pengguna kembali ke halaman utama!
- **Membuka formulir dari kartu aksi:**
  - Metode yang digunakan adalah **`Navigator.push()`**.
  - Pada widget kartu aksi (`ItemCard` di `lib/widgets/project_card.dart`), properti `onTap` dari `InkWell` mendeteksi ketukan pengguna. Jika kartu yang ditekan adalah "Tambah Proyek" atau "Tambah Edukasi", `Navigator.push()` dipanggil dengan membungkus halaman tujuan ke dalam `MaterialPageRoute`:
    ```dart
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationFormPage(),
      ),
    );
    ```
  - Dengan metode `push()`, halaman formulir ditumpuk di atas halaman beranda, sehingga tombol *Back* otomatis muncul di antarmuka atau dapat menggunakan gestur kembali bawaan gawai untuk kembali ke beranda.

- **Opsi *Home* di drawer membawa pengguna kembali:**
  - Pada widget `LeftDrawer` (`lib/widgets/left_drawer.dart`), opsi menu *Home* menggunakan **`Navigator.pushReplacement()`**:
    ```dart
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
    ```
  - Metode `pushReplacement()` akan membuang halaman formulir yang sedang aktif dari puncak stack dan menaruh `MyHomePage` sebagai gantinya. Hal ini mencegah bertumpuknya rute halaman yang sama di dalam memori saat pengguna berpindah-pindah antar menu drawer.

---

### 3. Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten?
Dalam panduan **Material Design**, konsistensi tata letak visual sangat krusial bagi pengalaman pengguna (*user experience*):
- **`Scaffold`** berperan sebagai kerangka dasar (*scaffolding*) halaman yang menyediakan slot-slot struktural standar, seperti `appBar`, `drawer`, `body`, `floatingActionButton`, dan `bottomNavigationBar`. Setiap halaman yang dibungkus `Scaffold` memiliki tata letak fondasi yang seragam.
- **`AppBar`** memberikan penanda identitas visual di bagian atas setiap halaman, memuat judul halaman yang terpusat, tema warna latar belakang yang seragam (`Colors.indigo`), serta tombol aksi. Keberadaan `drawer` pada `Scaffold` secara otomatis membuat `AppBar` menampilkan ikon navigasi *hamburger menu* (☰) secara konsisten di sudut kiri atas.
- **`Drawer`** (`LeftDrawer`) bertindak sebagai komponen navigasi global yang dapat diakses dari halaman mana pun yang mendaftarkannya pada properti `drawer: const LeftDrawer()`. Dengan memisahkan `LeftDrawer` ke dalam berkas widget tersendiri, menu navigasi, header, dan tautan rute dapat digunakan kembali (*reusable*) tanpa duplikasi kode, memastikan pengguna selalu memiliki akses ke seluruh bagian aplikasi dengan tampilan dan perilaku yang sama.

---

### 4. Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman!
Salah satu contoh utama adalah penggunaan warna **`Colors.indigo`** sebagai warna primer tema aplikasi:
1. **Pada `lib/main.dart`**: Didefinisikan sebagai *seed color* skema warna global aplikasi:
   ```dart
   colorScheme: ColorScheme.fromSeed(
     seedColor: Colors.indigo,
     secondary: Colors.amber[700],
   )
   ```
2. **Pada `lib/screens/menu.dart`**: Digunakan sebagai warna latar belakang `AppBar` melalui `Theme.of(context).colorScheme.primary` serta warna kartu "Lihat Proyek".
3. **Pada `lib/widgets/left_drawer.dart`**: Digunakan sebagai warna latar belakang dekorasi `DrawerHeader` (`color: Colors.indigo`).
4. **Pada `lib/screens/project_form.dart` dan `lib/screens/education_form.dart`**: Digunakan secara eksplisit sebagai warna latar belakang `AppBar` (`backgroundColor: Colors.indigo`), warna tombol simpan `ElevatedButton` (`WidgetStateProperty.all(Colors.indigo)`), serta warna aktif `CheckboxListTile`.

---

### 5. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak (*spacer*) dan widget penggulir (*scrollable widgets*) ketika ruang layar terbatas!
- **Alasan Pemilihan Tata Letak Formulir:**
  Tata letak formulir dirancang menggunakan struktur vertikal (`Column`) dengan urutan masukan yang logis dari atas ke bawah (mulai dari data institusi, gelar, periode waktu, status, hingga deskripsi/pencapaian) yang diakhiri tombol *Save* di bagian bawah (`Align(alignment: Alignment.bottomCenter)`). Pola ini memberikan alur pengisian formulir yang intuitif, alami, dan fokus bagi pengguna perangkat bergerak (*mobile*).

- **Peran Widget Pengatur Jarak (*Spacer* / `Padding` / `SizedBox`):**
  Widget seperti `Padding` (misalnya `EdgeInsets.all(8.0)`) dan `SizedBox` memberikan ruang kosong (*white space*) dan pemisah visual yang teratur antar-elemen input. Hal ini mencegah formulir terlihat padat, memudahkan keterbacaan label/hint text, serta memperbesar area sentuh (*touch target*) agar pengguna tidak salah menekan elemen input di layar sentuh.

- **Peran Widget Penggulir (*Scrollable Widgets* / `SingleChildScrollView`):**
  Layar perangkat mobile memiliki keterbatasan ukuran vertikal, terutama ketika papan ketik virtual (*on-screen virtual keyboard*) muncul saat pengguna mengisi teks. Jika konten melebihi ruang yang tersedia tanpa pembungkus scrollable, Flutter akan memicu galat **RenderFlex overflowed**. Dengan membungkus seluruh `Column` formulir (serta isi konten `AlertDialog`) ke dalam **`SingleChildScrollView`**, seluruh elemen formulir tetap dapat digulir dengan mulus dan dapat dijangkau oleh pengguna tanpa memicu galat visual.

---

### Langkah-langkah Implementasi Checklist Tugas 8
1. **Memilih Model Portofolio:**
   Memilih model **Edukasi (`Education`)** yang selaras dengan model yang sebelumnya dibangun pada backend Django myportofolio (`institution`, `degree`, `start_year`, `end_year`, `is_current`, `description`).
2. **Membuat Halaman Formulir Baru (`lib/screens/education_form.dart`):**
   - Mengimplementasikan `StatefulWidget` bernama `EducationFormPage`.
   - Menggunakan `Form` yang dikontrol oleh `final _formKey = GlobalKey<FormState>()`.
   - Menyediakan beragam elemen input sesuai tipe datanya:
     - `TextFormField` untuk Nama Institusi dan Gelar/Jurusan.
     - `TextFormField` dengan `keyboardType: TextInputType.number` untuk Tahun Mulai dan Tahun Selesai.
     - `CheckboxListTile` untuk status Sedang Berjalan (Masih Menempuh).
     - `TextFormField` dengan `maxLines: 4` untuk Deskripsi/Pencapaian.
   - Menambahkan validasi komprehensif: memeriksa nilai tidak kosong / bukan hanya spasi, memvalidasi rentang tahun 1900–2100, serta memastikan tahun selesai tidak mendahului tahun mulai jika tidak sedang berjalan.
   - Mengimplementasikan tombol *Save* yang memvalidasi form dan memunculkan `AlertDialog` berisi rangkuman data input yang baru dimasukkan.
3. **Mengintegrasikan Navigasi di Drawer (`lib/widgets/left_drawer.dart`):**
   - Menambahkan menu `ListTile` bertajuk "Add Education" dengan ikon `Icons.school_outlined` yang menavigasikan pengguna ke `EducationFormPage` menggunakan `Navigator.pushReplacement()`.
4. **Menambahkan Kartu Aksi Baru di Halaman Utama (`menu.dart` & `project_card.dart`):**
   - Menambahkan objek `ItemHomepage("Tambah Edukasi", Icons.school, Colors.teal[700]!)` ke dalam daftar `items` di `MyHomePage`.
   - Mengonfigurasi `ItemCard` agar memanggil `Navigator.push()` ke `EducationFormPage` saat kartu "Tambah Edukasi" ditekan.
5. **Memverifikasi Kualitas Kode & Pengujian:**
   - Menambahkan unit/widget test pada `test/widget_test.dart` untuk memastikan halaman beranda menampilkan kartu "Tambah Edukasi" dan navigasi ke `EducationFormPage` berjalan lancar.
   - Menjalankan `flutter analyze` untuk memastikan tidak ada pesan galat maupun peringatan linting (*No issues found!*).
   - Menjalankan `flutter test` untuk memastikan semua pengujian lulus.

---

### AI Disclosure
- **Alat Bantu yang Digunakan:** Antigravity AI Coding Assistant berbasis model LLM (Large Language Model).
- **Strategi Prompting:** 
  1. Menyediakan konteks kode yang telah dirapikan pada Tutorial 09 (struktur `screens/` dan `widgets/`, penggunaan paket `material_ui`).
  2. Merujuk pada model `Education` yang telah diimplementasikan pada proyek web Django sebelumnya untuk memastikan konsistensi field data.
  3. Meminta panduan pembuatan form dengan validasi null-safety dan integrasi navigasi tombol kartu serta drawer.
  4. Menyusun jawaban reflektif konseptual mengenai manajemen routing, layout widget, theming, dan form state.
- **Bagian yang Dibantu oleh AI:**
  - Penulisan draf awal struktur kode `education_form.dart` berserta controller state dan widget formulir.
  - Formulasi draf awal jawaban atas 5 pertanyaan reflektif konseptual berdasarkan materi PBP Flutter.
- **Keterbatasan AI & Perbaikan/Penyesuaian Manual yang Dilakukan:**
  - *Deteksi Dependensi Modul:* Saran awal dari model bahasa terkadang mereferensikan dependensi lama `package:flutter/material.dart`. Dilakukan verifikasi dan penyesuaian manual agar seluruh import konsisten menggunakan `package:material_ui/material_ui.dart` sesuai pembaruan kurikulum PBP.
  - *Logika Relasi Antar-Field Formulir:* Draf awal form dari AI memperlakukan field tahun selesai sebagai input mandiri. Dilakukan penyesuaian logika manual di mana input Tahun Selesai disembunyikan/dikosongkan secara dinamis jika pengguna mencentang *Sedang Berjalan (Masih Menempuh)*, serta ditambahkan validasi silang agar tahun selesai tidak lebih kecil dari tahun mulai.
  - *Konsistensi Desain Visual:* Dilakukan penyesuaian warna kartu aksi "Tambah Edukasi" (`Colors.teal[700]!`) agar kontras dan selaras dengan kartu aksi lainnya, serta penyesuaian header pop-up ringkasan.
