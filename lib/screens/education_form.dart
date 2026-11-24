import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _institution = "";
  String _degree = "";
  String _startYear = "";
  String _endYear = "";
  bool _isCurrent = false;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Education Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Institusi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Nama Institusi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Gelar / Jurusan ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: S1 Sistem Informasi",
                    labelText: "Gelar / Jurusan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _degree = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Gelar / jurusan tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Tahun Mulai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Contoh: 2022",
                    labelText: "Tahun Mulai",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _startYear = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Tahun mulai tidak boleh kosong!";
                    }
                    final int? year = int.tryParse(value.trim());
                    if (year == null || year < 1900 || year > 2100) {
                      return "Masukkan tahun yang valid (1900 - 2100)!";
                    }
                    return null;
                  },
                ),
              ),

              // === Sedang Menempuh Pendidikan ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CheckboxListTile(
                  title: const Text("Sedang Berjalan (Masih Menempuh)"),
                  value: _isCurrent,
                  activeColor: Colors.indigo,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCurrent = value ?? false;
                      if (_isCurrent) {
                        _endYear = "";
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              ),

              // === Tahun Selesai ===
              if (!_isCurrent)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Contoh: 2026",
                      labelText: "Tahun Selesai",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _endYear = value!;
                      });
                    },
                    validator: (String? value) {
                      if (!_isCurrent) {
                        if (value == null || value.trim().isEmpty) {
                          return "Tahun selesai tidak boleh kosong jika tidak sedang berjalan!";
                        }
                        final int? end = int.tryParse(value.trim());
                        final int? start = int.tryParse(_startYear.trim());
                        if (end == null || end < 1900 || end > 2100) {
                          return "Masukkan tahun yang valid (1900 - 2100)!";
                        }
                        if (start != null && end < start) {
                          return "Tahun selesai tidak boleh sebelum tahun mulai!";
                        }
                      }
                      return null;
                    },
                  ),
                ),

              // === Deskripsi / Aktivitas ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Ceritakan kegiatan, organisasi, atau pencapaianmu",
                    labelText: "Deskripsi / Aktivitas",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edukasi berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institusi: $_institution'),
                                    Text('Gelar / Jurusan: $_degree'),
                                    Text('Tahun Mulai: $_startYear'),
                                    Text(
                                      'Tahun Selesai: ${_isCurrent ? "Sedang Berjalan (Sekarang)" : _endYear}',
                                    ),
                                    Text(
                                      'Status: ${_isCurrent ? "Masih Menempuh" : "Lulus / Selesai"}',
                                    ),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _isCurrent = false;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
