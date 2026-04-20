import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'alerts_inbox_screen.dart';
import 'weather_details_screen.dart';
import 'crop_guide_scanner_screen.dart';
import 'profile_settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceContainerLow.withAlpha(200),
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuD2xCZHiQDm_nmeSpwou0Kh4JtUAijRCQi-3uPJUFb5jSzxUf4Xw51ssjS0W8rThx7KQ9sHUHUv8dltTLvfpVH14jms6hEr4RmmEeX50iDJOOWly_0_4YAoR_dHCQn1JvnC6TeR9LfyHMZegm53Mg25EOUwQDcMqhgHBx_rR6L40zsYrIAiva7-mgThUaJqAO6eufAYU1jm38mcNVX6NJFjRQdx0lT3ZcJ-FF4GK42ZkpkWrtXWHYPR7hlZYTeXEJYKYVC65_qU29cY',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const CircleAvatar(backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
            ),
          ),
        ),
        title: Text(
          'Krishi Advice',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.translate),
              color: theme.colorScheme.primary,
              style: IconButton.styleFrom(
                hoverColor: AppColors.surfaceVariant,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardContent();
      case 1:
        return const WeatherDetailsScreen();
      case 2:
        return const CropGuideScannerScreen();
      case 3:
        return const AlertsInboxScreen();
      case 4:
        return const ProfileSettingsScreen();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24).copyWith(bottom: 120),
      child: Column(
        children: [
          // Critical Alert Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.error,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.onSurface.withAlpha(20),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning, color: theme.colorScheme.onError, size: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active Storm Warning',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onError,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Severe thunderstorms expected in your area within the next 2 hours. Secure loose equipment and seek shelter.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onError.withAlpha(230),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Weather Glance (Hero)
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDrhJPtxHaKD6puCZ9AySsyQX_5bmCjxYwOJaH9uC_QBsX9njd-hWmDdhLvvWmjIF4iane8oTDTaHTlZLyEwNnZY2xVZJfywE0XtaI7pkblIiUG__3a_7eH9um3wugDhe7ArhZ0Hb1-u54X1i9KrV1BiftnNsEBIcvKrE94hRLuB9pODeDcTQyyIngso1N3PWkRuMsX2vMj-6_8IB8F7BILzWgcEMrgbyUX2g6Vyjc_KyHBNytDyrjN8aNElT_OIouWifNni2LxeX2H',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.surface.withAlpha(200),
                          AppColors.surfaceContainerLow.withAlpha(230),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CURRENT CONDITIONS',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '32°C',
                            style: theme.textTheme.displayLarge?.copyWith(
                              color: theme.colorScheme.primary,
                              fontSize: 56,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Icon(
                              Icons.wb_cloudy,
                              size: 48,
                              color: AppColors.tertiaryFixedDim,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.water_drop, size: 16, color: theme.colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Text('85% Humidity', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                          const SizedBox(width: 16),
                          Icon(Icons.air, size: 16, color: theme.colorScheme.onSurfaceVariant),
                          const SizedBox(width: 4),
                          Text('12 km/h', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Forecast Row
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildForecastSlot(context, '12:00', Icons.wb_sunny, '33°', AppColors.primary),
                            const SizedBox(width: 16),
                            _buildForecastSlot(context, '15:00', Icons.cloud, '31°', AppColors.primary),
                            const SizedBox(width: 16),
                            _buildForecastSlot(context, '18:00', Icons.thunderstorm, '28°', AppColors.error, isCritical: true),
                            const SizedBox(width: 16),
                            _buildForecastSlot(context, '21:00', Icons.beach_access, '25°', AppColors.secondary),
                            const SizedBox(width: 16),
                            _buildForecastSlot(context, '00:00', Icons.nights_stay, '22°', AppColors.onSurfaceVariant),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Actionable Feed (Bento Grid)
          // Get Crop Advice
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
                      ],
                    ),
                    child: Icon(Icons.forum, color: theme.colorScheme.primary),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Get Crop Advice',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Consult with our AI agronomist for immediate insights.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        gradient: LinearGradient(
                          colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/crop_wizard');
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                        child: Text(
                          'Ask Now',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Disease ID
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAE5F2sNFl622Ub2huh94h6aSQDybooUR3F0xksIQgl6Gu4x6L_FfTwJzQ19uVuX1vepSeBm0t5JPZUomMVP6Ecz9jZU3j8zlUBI72hXirBDTC57kZCfMZgGEVtgUoiJOEB7X7Z7RnO-f4j8-Hf7dHMAVDV139besRFVolKi9jQeRTIVnsTgUiwsEZa94KBdSAuvqxdMxH6sFN_JG0LVZr6MP4CWcK071zmFpXA91V7hKSR8NhA3_M-s-2Ry0iZLbs35OSEt26t6IUU',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withAlpha(50),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.photo_camera, color: theme.colorScheme.onPrimary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Disease ID',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Scan leaves to instantly identify potential issues.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 24),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        color: AppColors.surfaceContainerLowest,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.camera_alt, color: theme.colorScheme.primary, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Open Camera',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Recent Alerts Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Alerts',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: Text(
                        'View All',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildRecentAlertItem(
                  context,
                  title: 'Low Soil Moisture: Field B',
                  subtitle: 'Moisture levels dropped below 30%. Irrigation recommended within 24h.',
                  icon: Icons.water_drop,
                  iconBg: AppColors.tertiaryFixed,
                  iconColor: AppColors.onTertiaryFixed,
                ),
                const SizedBox(height: 16),
                _buildRecentAlertItem(
                  context,
                  title: 'Optimal Harvest Window: Corn',
                  subtitle: 'Conditions are ideal for harvesting in the North Sector for the next 3 days.',
                  icon: Icons.eco,
                  iconBg: AppColors.surfaceContainerHighest,
                  iconColor: AppColors.onSurface,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentAlertItem(BuildContext context, {required String title, required String subtitle, required IconData icon, required Color iconBg, required Color iconColor}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastSlot(BuildContext context, String time, IconData icon, String temp, Color color, {bool isCritical = false}) {
    final theme = Theme.of(context);
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isCritical ? AppColors.error : AppColors.onSurfaceVariant,
              fontWeight: isCritical ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          const Spacer(),
          Icon(icon, color: color, size: 28),
          const Spacer(),
          Text(
            temp,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isCritical ? AppColors.error : AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        color: AppColors.surface.withAlpha(230),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withAlpha(20),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(0, Icons.grid_view, 'Home'),
          _buildNavItem(1, Icons.wb_cloudy, 'Weather'),
          _buildNavItem(2, Icons.photo_camera, 'Scan'),
          _buildNavItem(3, Icons.notifications, 'Alerts'),
          _buildNavItem(4, Icons.account_circle, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.transparent, // Ensures the tap target is decent
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.outlineVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected ? AppColors.primary : AppColors.outlineVariant,
                fontSize: 10,
                letterSpacing: 1.5,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
