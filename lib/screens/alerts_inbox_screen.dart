import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AlertsInboxScreen extends StatelessWidget {
  const AlertsInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inbox',
            style: theme.textTheme.displaySmall?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage your farm alerts and updates.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),
          
          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryTab(context, 'General Updates', isSelected: false),
                const SizedBox(width: 12),
                _buildCategoryTab(context, 'Govt (BRRI) Alerts', isSelected: true),
                const SizedBox(width: 12),
                _buildCategoryTab(context, 'My Farm Reminders', isSelected: false),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Notification List
          _buildAlertItem(
            context,
            title: 'Flood Warning - BRRI',
            time: 'Just now',
            description: 'Immediate action required. Heavy rainfall expected in the next 24 hours. Secure all loose equipment and move livestock to higher ground immediately.',
            icon: Icons.warning,
            iconColor: AppColors.error,
            bgColor: AppColors.errorContainer,
            isUnread: true,
            isUrgent: true,
          ),
          const SizedBox(height: 16),
          _buildAlertItem(
            context,
            title: 'Pest Outbreak Detected',
            time: '2h ago',
            description: 'Brown Plant Hopper detected in neighboring sectors. BRRI advises immediate prophylactic spraying of Sector B.',
            icon: Icons.bug_report,
            iconColor: AppColors.tertiary,
            bgColor: AppColors.surfaceContainerLow,
            indicatorColor: AppColors.tertiaryFixedDim,
            isUnread: true,
          ),
          const SizedBox(height: 16),
          _buildAlertItem(
            context,
            title: 'Weather Update',
            time: 'Yesterday',
            description: 'Expected dry spell for the next 3 days. Optimal conditions for harvesting in Sector A.',
            icon: Icons.cloud,
            iconColor: AppColors.onSurface,
            bgColor: AppColors.surface,
            isUnread: false,
          ),
          const SizedBox(height: 16),
          _buildAlertItem(
            context,
            title: 'Subsidy Approved',
            time: 'Oct 12',
            description: 'Your application for the BRRI fertilizer subsidy has been approved. Funds will be disbursed shortly.',
            icon: Icons.check_circle,
            iconColor: AppColors.onPrimaryFixed,
            bgColor: AppColors.surface,
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(BuildContext context, String label, {required bool isSelected}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.primary : AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
        boxShadow: isSelected ? [
          BoxShadow(
            color: theme.colorScheme.primary.withAlpha(50),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ] : null,
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAlertItem(
    BuildContext context, {
    required String title,
    required String time,
    required String description,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required bool isUnread,
    bool isUrgent = false,
    Color? indicatorColor,
  }) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isUrgent ? iconColor : iconColor.withAlpha(40),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: isUrgent ? Colors.white : iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isUrgent ? AppColors.onErrorContainer : theme.colorScheme.onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          time,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (isUrgent) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: iconColor.withAlpha(40),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'Urgent',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.onErrorContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isUnread) ...[
                const SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isUrgent ? AppColors.error : (indicatorColor ?? AppColors.tertiary),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (indicatorColor != null || isUrgent)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: isUrgent ? AppColors.error : indicatorColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
