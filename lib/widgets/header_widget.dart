import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  final VoidCallback onNotification;
  final VoidCallback onProfile;

  const HeaderWidget({
    super.key,
    required this.userName,
    required this.onNotification,
    required this.onProfile,
  });

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 11) return 'Selamat Pagi';
    if (h < 15) return 'Selamat Siang';
    if (h < 18) return 'Selamat Sore';
    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppTheme.navy, AppTheme.blue]),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.account_balance_wallet_rounded,
              color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nusa Pay',
                  style: TextStyle(fontSize: 12, color: AppTheme.grey)),
              Text('$_greeting, $userName!',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        Material(
          color: Colors.white,
          shape: const CircleBorder(),
          elevation: 1,
          child: IconButton(
            onPressed: onNotification,
            tooltip: 'Notifikasi',
            icon: const Badge(
              smallSize: 8,
              backgroundColor: AppTheme.red,
              child: Icon(Icons.notifications_none_rounded),
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onProfile,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: AppTheme.blue.withValues(alpha: 0.15),
            child: Text(userName.isNotEmpty ? userName[0] : '?',
                style: const TextStyle(
                    color: AppTheme.blue,
                    fontWeight: FontWeight.w800,
                    fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
