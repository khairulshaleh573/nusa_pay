import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class _BannerData {
  final String title;
  final String subtitle;
  final String cta;
  final IconData icon;
  final List<Color> colors;
  const _BannerData(this.title, this.subtitle, this.cta, this.icon, this.colors);
}

class PromoBanner extends StatefulWidget {
  final ValueChanged<String> onCta;

  const PromoBanner({super.key, required this.onCta});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final PageController _controller = PageController();
  int _page = 0;

  static const _banners = [
    _BannerData('Cashback 20% QRIS', 'Bayar di merchant favoritmu minggu ini.',
        'Klaim Sekarang', Icons.qr_code_2_rounded,
        [Color(0xFF16A34A), Color(0xFF0F766E)]),
    _BannerData('Top Up Gratis Admin', 'Isi saldo dari bank mana pun tanpa biaya.',
        'Top Up', Icons.account_balance_wallet_rounded,
        [Color(0xFF2563EB), Color(0xFF7C3AED)]),
    _BannerData('Bonus Pulsa 10rb', 'Beli paket data dan dapatkan bonus pulsa.',
        'Lihat Promo', Icons.card_giftcard_rounded,
        [Color(0xFFF59E0B), Color(0xFFEA580C)]),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _controller,
            itemCount: _banners.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) {
              final b = _banners[i];
              return Padding(
                padding: const EdgeInsets.only(right: 4, left: 4, bottom: 8),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: b.colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: AppTheme.softShadow,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(b.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
                            const SizedBox(height: 4),
                            Text(b.subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 12.5)),
                            const SizedBox(height: 12),
                            FilledButton(
                              onPressed: () => widget.onCta(b.title),
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppTheme.navy,
                                minimumSize: const Size(0, 34),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              child: Text(b.cta,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.5)),
                            ),
                          ],
                        ),
                      ),
                      Icon(b.icon,
                          size: 72, color: Colors.white.withValues(alpha: 0.3)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (i) {
            final active = i == _page;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 20 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: active ? AppTheme.blue : Colors.black12,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
