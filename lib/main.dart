import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'System Absensi',
      theme: ThemeData(useMaterial3: true),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    RiwayatPage(),
    IzinCutiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: _buildNavBar(),
      floatingActionButton: _buildScanQRButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // --------------------------------------------------
  // NAVBAR
  // --------------------------------------------------
  Widget _buildNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.dashboard_rounded,
            label: 'Dashboard',
            isSelected: _selectedIndex == 0,
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.history_rounded,
            label: 'Riwayat',
            isSelected: _selectedIndex == 1,
          ),

          const SizedBox(width: 55), // ruang tombol QR

          _buildNavItem(
            index: 2,
            icon: Icons.event_note_rounded,
            label: 'Izin/Cuti',
            isSelected: _selectedIndex == 2,
          ),
          _buildNavItem(
            index: 3,
            icon: Icons.person_rounded,
            label: 'Profil',
            isSelected: _selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // FLOATING QR BUTTON — SUDAH AKTIF
  // --------------------------------------------------
  Widget _buildScanQRButton() {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ScanQRPage()),
          );
        },
        backgroundColor: const Color(0xFF2563EB),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white, width: 4),
        ),
        child: const Icon(
          Icons.qr_code_scanner_rounded,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }

  // --------------------------------------------------
  // NAV ITEM
  // --------------------------------------------------
  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFFDBEAFE) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 22,
                color: isSelected
                    ? const Color(0xFF2563EB)
                    : const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF2563EB)
                    : const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// PAGES
// --------------------------------------------------

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      icon: Icons.dashboard_rounded,
      title: 'Dashboard',
      subtitle: 'Informasi Kehadiran Hari Ini',
    );
  }
}

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      icon: Icons.history_rounded,
      title: 'Riwayat Absensi',
    );
  }
}

class IzinCutiPage extends StatelessWidget {
  const IzinCutiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      icon: Icons.event_note_rounded,
      title: 'Izin & Cuti',
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageTemplate(
      icon: Icons.person_rounded,
      title: 'Profil Karyawan',
    );
  }
}

// --------------------------------------------------
// TEMPLATE HALAMAN REUSABLE
// --------------------------------------------------
Widget pageTemplate({
  required IconData icon,
  required String title,
  String? subtitle,
}) {
  return Scaffold(
    backgroundColor: const Color(0xFFF9FAFB),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 68, color: const Color(0xFF2563EB)),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF6B7280),
              ),
            ),
          ]
        ],
      ),
    ),
  );
}

// ==================================================
// QR SCANNER PAGE (mobile_scanner) — FINAL
// ==================================================

class ScanQRPage extends StatelessWidget {
  const ScanQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Absensi"),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;

          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;

            if (code != null) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("QR Terdeteksi: $code")),
              );
            }
          }
        },
      ),
    );
  }
}
