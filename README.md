# 🐴 System Absensi - Coach Aldo Ranch

**System Absensi** adalah aplikasi mobile berbasis **Flutter** yang dikembangkan untuk mengelola kehadiran karyawan di **tempat wisata berkuda (Coach Aldo Ranch)** secara efisien dan real-time.  
Aplikasi ini dirancang dengan antarmuka modern, ringan, dan mudah digunakan baik untuk petugas maupun manajer operasional.

---

## 🚀 Fitur Utama

- ✅ **Login & Autentikasi** — akses berdasarkan peran (admin / petugas)
- 📍 **Absensi Realtime** — mencatat kehadiran langsung melalui perangkat mobile
- 🐎 **Dashboard Ringkas** — menampilkan statistik hadir, izin, dan terlambat
- 🕒 **Jadwal Aktivitas Harian** — jadwal operasional wisata dan perawatan kuda
- 📊 **Grafik Kehadiran** — visualisasi data absensi mingguan
- 💾 **Export Data (CSV)** — ekspor laporan absensi untuk administrasi
- 🌙 **UI Responsif & Konsisten** — tema khas "Coach Aldo Ranch" bernuansa oranye dengan sentuhan alami

---

## 📁 Struktur Project

```
lib/
├── main.dart
├── routes.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── forgot_password_screen.dart
│   │   └── verify_account_screen.dart
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── dashboard_screen.dart
│   │   ├── schedule_screen.dart
│   │   └── attendance_history_screen.dart
│   ├── attendance/
│   │   ├── attendance_screen.dart
│   │   ├── qr_scanner_screen.dart
│   │   ├── location_verification_screen.dart
│   │   └── attendance_success_screen.dart
│   ├── schedule/
│   │   ├── schedule_list_screen.dart
│   │   ├── schedule_detail_screen.dart
│   │   ├── add_schedule_screen.dart
│   │   └── edit_schedule_screen.dart
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   ├── edit_profile_screen.dart
│   │   └── settings_screen.dart
│   └── splash/
│       └── splash_screen.dart
├── widgets/
│   ├── custom_button.dart
│   ├── custom_input.dart
│   ├── attendance_card.dart
│   ├── schedule_card.dart
│   ├── bottom_nav.dart
│   ├── date_picker.dart
│   ├── time_picker.dart
│   └── location_indicator.dart
├── models/
│   ├── user_model.dart
│   ├── attendance_model.dart
│   ├── schedule_model.dart
│   └── location_model.dart
├── services/
│   ├── auth_service.dart
│   ├── attendance_service.dart
│   ├── schedule_service.dart
│   ├── location_service.dart
│   ├── notification_service.dart
│   └── api_service.dart
├── utils/
│   ├── constants.dart
│   ├── theme.dart
│   ├── validators.dart
│   ├── date_time_utils.dart
│   ├── location_utils.dart
│   └── qr_generator.dart
└── blocs/
    ├── auth_bloc.dart
    ├── attendance_bloc.dart
    ├── schedule_bloc.dart
    └── location_bloc.dart
```

### 📋 Penjelasan Struktur:

- **`screens/`** - Kumpulan halaman aplikasi

  - **`auth/`** - Autentikasi pengguna (login, register, dll.)
  - **`home/`** - Dashboard dan halaman utama
  - **`attendance/`** - Fitur absensi dan pemindaian QR
  - **`schedule/`** - Manajemen jadwal aktivitas
  - **`profile/`** - Profil pengguna dan pengaturan

- **`widgets/`** - Komponen UI yang dapat digunakan kembali
- **`models/`** - Model data untuk aplikasi
- **`services/`** - Layer bisnis dan komunikasi API
- **`utils/`** - Utility dan helper functions
- **`blocs/`** - State management menggunakan BLoC pattern

---

## 🧩 Teknologi yang Digunakan

| Layer                 | Teknologi                                     |
| --------------------- | --------------------------------------------- |
| **Frontend (Mobile)** | Flutter (Dart)                                |
| **Backend**           | Firebase / REST API                           |
| **Database**          | Cloud Firestore / MySQL                       |
| **State Management**  | BLoC Pattern                                  |
| **Design System**     | Custom Flutter Theme (Coach Aldo Ranch Style) |
| **Version Control**   | Git & GitHub                                  |

### 📦 Dependencies Utama:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  http: ^1.1.0
  shared_preferences: ^2.2.2
  qr_code_scanner: ^1.0.1
  geolocator: ^11.0.1
  intl: ^0.18.1
  permission_handler: ^11.0.1
```

---

## 📱 Tampilan Antarmuka

- **Splash Screen** - Loader dengan logo Coach Aldo Ranch
- **Login Screen** - Form autentikasi untuk admin/petugas
- **Dashboard** - Statistik kehadiran & jadwal harian
- **Absensi** - Interface check-in/check-out dengan QR scanner
- **Jadwal** - Management aktivitas harian kuda dan wisata
- **Profil** - Informasi pengguna dan pengaturan aplikasi

> 🎨 Desain diadaptasi dari tema branding _Coach Aldo Ranch_ dengan warna dominan oranye dan elemen kayu alami yang merepresentasikan suasana wisata berkuda.

---

## ⚙️ Cara Menjalankan Proyek

Pastikan kamu sudah menginstal [Flutter SDK](https://docs.flutter.dev/get-started/install).

```bash
# Clone repository ini
git clone https://github.com/coach-aldo-ranch/system-absensi.git

# Masuk ke direktori project
cd system-absensi

# Install dependencies
flutter pub get

# Jalankan aplikasi
flutter run
```

### 🛠️ Build untuk Production:

```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release

# Build iOS
flutter build ios --release
```

> 💡 Gunakan emulator Android atau perangkat fisik agar semua fitur berjalan optimal.

---

## 🔧 Konfigurasi Environment

Buat file `lib/utils/config.dart` dengan konfigurasi:

```dart
class Config {
  static const String appName = "Coach Aldo Ranch Absensi";
  static const String apiUrl = "https://api.coachaldoranch.com";
  static const String primaryColor = "#FF6B35";
  static const String secondaryColor = "#8B4513";
}
```

---

## 🧠 Pengembangan Selanjutnya

- [ ] Integrasi GPS untuk pencatatan lokasi absensi
- [ ] Fitur notifikasi otomatis untuk keterlambatan
- [ ] Sistem multi-cabang (untuk lokasi wisata lain)
- [ ] Dashboard web berbasis admin panel
- [ ] Integrasi dengan sistem payroll
- [ ] Laporan analitik kehadiran bulanan
- [ ] Backup data otomatis ke cloud storage

---

## 👨‍💻 Tim Pengembang

**Strong Bee Developer**  
🟠 Freelance Software Studio – spesialisasi pada sistem manajemen & otomasi berbasis Flutter dan Web.  
📧 Email: [support@strongbeedev.com](mailto:support@strongbeedev.com)  
🌐 Website: [https://strongbeedev.com](https://strongbeedev.com)

---

## 📜 Lisensi

Proyek ini dilindungi oleh lisensi MIT. Silakan gunakan, modifikasi, dan distribusikan dengan menyertakan atribusi kepada pengembang asli.

---

## 🤝 Kontribusi

Kami menyambut kontribusi dari developer lain! Silakan:

1. Fork project ini
2. Buat feature branch (`git checkout -b feature/namafitur`)
3. Commit perubahan (`git commit -m 'Menambah fitur X'`)
4. Push ke branch (`git push origin feature/namafitur`)
5. Buat Pull Request

---

**🐎 _Managing Horse Ranch Attendance with Modern Technology_**
