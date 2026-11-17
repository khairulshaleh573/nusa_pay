import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../widgets/balance_card.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header_widget.dart';
import '../widgets/promo_banner.dart';
import '../widgets/quick_menu.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  static const _tabs = ['Home', 'Mutasi', 'QRIS', 'Promo', 'Profile'];

  void _toast(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1200),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _index == 0
            ? _buildHome()
            : Center(
                child: Text(
                  'Halaman ${_tabs[_index]}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _index,
        onChanged: (i) => setState(() => _index = i),
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(
            userName: 'Khairul',
            onNotification: () => _toast('Tidak ada notifikasi baru'),
            onProfile: () => setState(() => _index = 4),
          ),
          const SizedBox(height: 20),
          BalanceCard(
            balance: -9999999,
            accountNumber: '8994143864',
            onTopUp: () => _toast('Top Up dipilih'),
            onTransfer: () => _toast('Transfer dipilih'),
          ),
          const SizedBox(height: 24),
          _section('Menu Cepat'),
          QuickMenu(onTap: (label) => _toast('Menu $label dipilih')),
          const SizedBox(height: 24),
          _section('Promo Spesial'),
          PromoBanner(onCta: (title) => _toast('Promo: $title')),
          const SizedBox(height: 24),
          _section('Transaksi Terakhir',
              action: 'Lihat Semua',
              onAction: () => setState(() => _index = 1)),
          const TransactionList(transactions: dummyTransactions),
        ],
      ),
    );
  }

  Widget _section(String title, {String? action, VoidCallback? onAction}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          if (action != null)
            GestureDetector(
              onTap: onAction,
              child: Text(action,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary)),
            ),
        ],
      ),
    );
  }
}
