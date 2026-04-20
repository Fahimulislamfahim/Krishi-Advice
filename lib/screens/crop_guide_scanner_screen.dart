import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CropGuideScannerScreen extends StatelessWidget {
  const CropGuideScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Corn Field ',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'Alpha',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: AppColors.tertiaryFixedDim,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Growth Stage Tracking & Diagnostics',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.outline,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 32),

          // Hero Component
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDtdlu6v9mma_CQg77ZkY5Ay11tmrxPn_7MCizrBW2lNIthf966tQjp4bhbT74nfvbVgpIWrtqLbhRA98fV1K0ziUhQzjs-0xJKXs4dERwQd6Yox_5NHquP3iyQCeGnTXARUctid8CZSaX4fMdkWr3Gdd-_gY6iLKIE0PDrCFN6qiPu8kspwyqGM_ZhB29wgXQd9ue9y9mi0OFl_hHaIg55zfwDet5ilUdEeoy3ogFIlfFrZii5SeiZSUsgXRMalgp752QPxI9U-TeT',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          theme.colorScheme.inverseSurface.withAlpha(200),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withAlpha(200),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withAlpha(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CURRENT PHASE',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Vegetative (V6)',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Planted 45 Days Ago',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryFixed,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.water_drop, size: 14, color: theme.colorScheme.onPrimaryFixed),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Good',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onPrimaryFixed,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '98%',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'HEALTH SCORE',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Growth Tracker Timeline
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
                      'Growth Tracker',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View Full Cycle',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildTimelineItem(
                  context,
                  title: 'V2 Stage Reached',
                  subtitle: 'Day 14 • Emergence',
                  description: 'Two collared leaves visible. Stand count completed with 95% emergence rate.',
                  icon: Icons.check,
                  iconBg: theme.colorScheme.primary,
                  isLast: false,
                  isCompleted: true,
                ),
                _buildTimelineItem(
                  context,
                  title: 'V6 Stage - Key Action Required',
                  subtitle: 'Day 45 • Today',
                  description: 'Growing point is now above soil surface. Plant is rapidly taking up nitrogen. Time for sidedress application.',
                  icon: Icons.eco,
                  iconBg: AppColors.tertiaryFixedDim,
                  isLast: false,
                  isCurrent: true,
                  actionTitle: 'Apply Urea Nitrogen',
                  actionSubtitle: 'Target: 60 lbs/acre actual N',
                ),
                _buildTimelineItem(
                  context,
                  title: 'V10 Stage (Rapid Growth)',
                  subtitle: 'Day 60 • Upcoming',
                  description: 'Expected new leaf every 2-3 days. Ear shoot begins to develop.',
                  icon: Icons.circle,
                  iconBg: theme.colorScheme.surfaceContainerHighest,
                  isLast: true,
                  isUpcoming: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // AI Scanner Promo
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(50),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pest & Disease Lens',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Scan anomalies for instant AI analysis',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(50),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.center_focus_strong, color: Colors.white, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _buildScanPreview('https://lh3.googleusercontent.com/aida-public/AB6AXuDlmcS4NgO4hHbYXBUqQCFoNd1H514PHaE8uD7VFLwnYL4nNNgiKhRtRy-6WyZHlQltCvvyuux_-6k3HdrlBsL85-6y-wdXXKU13lZxIGHccNY2yQjON6KXg2STvoRbEscnARo0XqBCnIE3zpVqLPiORBovck-wTMfOkUOYnhoQvvg2QiPDI9nznhu795Ut1Y9WL4iS1-EAhZoLykjvCtJnxSAY-840hxcV997Lj5xVncECI3CWsnLDnw3LEdRSJ8a2GOyppRbUOUBV'),
                    const SizedBox(width: 12),
                    _buildScanPreview('https://lh3.googleusercontent.com/aida-public/AB6AXuBidf_0A9sSLp6fQd3D2cg6L7ZtWaee-ajN9hiAPia00wqpbLewstjXkgLfkPkXrugEOjfvDlnDkvTEhKEJJ7mFnH7agIvtPujlIt7hHi_sA341OMkTlcyRmwsyWdMXv1VYxQt88fDqtxfU6erbsoJHTyYAs5_u8DlEyJx7I4m_zoLgfdnX8gnLQLJyESI54TAF5cHCmm4oHUcYiMMQFBk3-BZZ7c_0A7xpynzz65rvUF_k2Oxf3CZCzzs9vxQpHaaX1MEOg5IwTX4H'),
                    const SizedBox(width: 12),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(30),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withAlpha(50)),
                      ),
                      child: const Icon(Icons.add_a_photo, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('AI Diagnostic Scanner starting...'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  color: Colors.white,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.document_scanner, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Open Scanner',
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
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Color iconBg,
    required bool isLast,
    bool isCompleted = false,
    bool isCurrent = false,
    bool isUpcoming = false,
    String? actionTitle,
    String? actionSubtitle,
  }) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surfaceContainerLow, width: 4),
                  boxShadow: isCurrent ? [
                    BoxShadow(color: iconBg.withAlpha(100), blurRadius: 15),
                  ] : null,
                ),
                child: Icon(icon, color: isUpcoming ? theme.colorScheme.outline : Colors.white, size: 14),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                    color: isUpcoming ? Colors.transparent : (isCurrent ? AppColors.surfaceContainerLowest : theme.colorScheme.surfaceContainerHighest.withAlpha(180)),
                    borderRadius: BorderRadius.circular(16),
                    border: isCurrent ? Border.all(color: theme.colorScheme.outlineVariant.withAlpha(50)) : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subtitle,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: isCurrent ? AppColors.tertiary : theme.colorScheme.outline,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          if (isCurrent)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.errorContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'ACTION',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.onErrorContainer,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isUpcoming ? theme.colorScheme.outline : theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                      if (actionTitle != null) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primaryContainer.withAlpha(40),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.science, color: theme.colorScheme.primaryContainer, size: 20),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      actionTitle,
                                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      actionSubtitle!,
                                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanPreview(String url) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(50)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Opacity(
        opacity: 0.7,
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }
}
