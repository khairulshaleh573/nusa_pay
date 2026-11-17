import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final String date;
  final String status;
  final int amount;
  final bool isIncoming;
  final IconData icon;

  const TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncoming,
    required this.status,
    required this.icon,
  });
}

String formatRupiah(int value) {
  final s = value
      .toString()
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => '.');
  return 'Rp$s';
}

const List<TransactionModel> dummyTransactions = [
  TransactionModel(
    title: 'Gaji Bulanan',
    date: '09 Nov 2026, 08:15',
    amount: 8500000,
    isIncoming: true,
    status: 'Berhasil',
    icon: Icons.payments_rounded,
  ),
  TransactionModel(
    title: 'Kopi Kenangan',
    date: '08 Nov 2026, 14:20',
    amount: 45000,
    isIncoming: false,
    status: 'Berhasil',
    icon: Icons.local_cafe_rounded,
  ),
  TransactionModel(
    title: 'Transfer ke Andi',
    date: '07 Nov 2026, 19:05',
    amount: 250000,
    isIncoming: false,
    status: 'Pending',
    icon: Icons.swap_horiz_rounded,
  ),
  TransactionModel(
    title: 'Top Up dari BCA',
    date: '06 Nov 2026, 10:40',
    amount: 1000000,
    isIncoming: true,
    status: 'Berhasil',
    icon: Icons.account_balance_rounded,
  ),
  TransactionModel(
    title: 'Token Listrik PLN',
    date: '05 Nov 2026, 21:12',
    amount: 200000,
    isIncoming: false,
    status: 'Berhasil',
    icon: Icons.bolt_rounded,
  ),
];
