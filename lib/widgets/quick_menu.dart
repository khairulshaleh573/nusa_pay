import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class _MenuItem {
  final String label;
  final IconData icon;
  const _MenuItem(this.label, this.icon);
}

class QuickMenu extends StatelessWidget {
  final ValueChanged<String> onTap;

  const QuickMenu({super.key, required this.onTap});

  static const _items = [
    _MenuItem('Transfer', Icons.swap_horiz_rounded),
    _MenuItem('Top Up', Icons.add_card_rounded),
    _MenuItem('QRIS', Icons.qr_code_scanner_rounded),
    _MenuItem('Pembayaran', Icons.payments_rounded),
    _MenuItem('Pulsa & Data', Icons.phone_android_rounded),
    _MenuItem('Tagihan', Icons.receipt_long_rounded),
    _MenuItem('Riwayat', Icons.history_rounded),
    _MenuItem('Lainnya', Icons.apps_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.softShadow,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 14,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, i) {
          final item = _items[i];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onTap(item.label),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppTheme.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(item.icon, color: AppTheme.blue, size: 26),
                ),
                const SizedBox(height: 8),
                Text(item.label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11.5, fontWeight: FontWeight.w600)),
              ],
            ),
          );
        },
      ),
    );
  }
}
