import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final List<Map<String, dynamic>> _plots = [
    {
      'title': 'North Field A',
      'status': 'Active',
      'crop': 'Wheat',
      'size': '120 Acres',
      'cropIcon': Icons.grass,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCewV0lukXKIcXifpzx8bjiXdyO7yOUcrGq6D3VGsKn9BH-Z22lINJcFyrM9Xvh6TOOPbz_xmrgNnEFPaRfRBMHo1AbCzII7txBvUoZv9b6zh1njqhh452DdVXAHJBzHzGxMhdLJg9neLqoMOfdHgzE81GnOdX9HN-kwgCVt7tsEXPb9DBiWj_ecfijcIa5uY40IMPugwWeKhpub8Ion_xPp0-hezVgWxJp5gMTznfgeczguwyCyWDxO8K_ermjS1qm0HTwHNq_F1tJ',
    },
    {
      'title': 'East Valley',
      'status': 'Active',
      'crop': 'Soybeans',
      'size': '85 Acres',
      'cropIcon': Icons.eco,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAUxhxXn02JC9ZlZC1leQFmMySo2z8vn7xn-f8BYennSdXwOhdgAEP__lp6-aMf10Yixs3jdWRAsF-xewZEoHlZg8Lm2sAzkLAcp1_GSSQKJr1pBcw6WVdSfGwAmxToOBF-vrQSeAkNFbhQ63392Cy8FuWZnJ0ggUeTkeA7o1518757gXZiZyx058jTrYioBfTRJqXrsacIoSer-vJYU9iBPYZggLci3nrm6FzoVcdq2Adyip3XHWPCvmWH3iXIu1YBwRkqdlW9_CjB',
    },
  ];

  void _showAddPlotDialog() {
    final nameController = TextEditingController();
    final sizeController = TextEditingController();
    final cropController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New Plot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Plot Name (e.g. South Ridge)'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: sizeController,
                decoration: const InputDecoration(labelText: 'Size (e.g. 40 Acres)'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cropController,
                decoration: const InputDecoration(labelText: 'Crop / Zone Type (e.g. Corn, Fallow)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && sizeController.text.isNotEmpty) {
                  setState(() {
                    _plots.add({
                      'title': nameController.text,
                      'status': 'Active',
                      'crop': cropController.text.isEmpty ? 'Unknown' : cropController.text,
                      'size': sizeController.text,
                      'cropIcon': Icons.eco,
                      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCMV0j46kCN8SE8dGnrFJfOcr_5ZW5HxGZgQXhgd5Esd20lYI2GRwFFe1cUBnJjQW7JcSjFznl8iwtyGEf4ynTus0w2OpiL_fBt40CLLlS0wZU2cQAbP603lUfnV3uYESpfc68LQ16cqTQ3fx8ngmwiqUp8CJ4Vd5rfWmZf2Es4vVmELwoVP4TA6uu-rTWXW_f6tWbT-froAuySSxRSGC9rJ2Uhp1bWsVtoPi0AcWYGV8ixvVNiAtTW9JZ4It-VbQzORYP3ovQOubpD',
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 56,
                          backgroundColor: AppColors.surfaceContainerHighest,
                          child: CircleAvatar(
                            radius: 52,
                            backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCewV0lukXKIcXifpzx8bjiXdyO7yOUcrGq6D3VGsKn9BH-Z22lINJcFyrM9Xvh6TOOPbz_xmrgNnEFPaRfRBMHo1AbCzII7txBvUoZv9b6zh1njqhh452DdVXAHJBzHzGxMhdLJg9neLqoMOfdHgzE81GnOdX9HN-kwgCVt7tsEXPb9DBiWj_ecfijcIa5uY40IMPugwWeKhpub8Ion_xPp0-hezVgWxJp5gMTznfgeczguwyCyWDxO8K_ermjS1qm0HTwHNq_F1tJ'),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit, color: theme.colorScheme.onPrimary, size: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fahimul Islam',
                            style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Senior Agronomist',
                            style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.outline),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: theme.colorScheme.primary, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Ashuliya, Savar ,Dhaka',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Role Switch
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 24, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Text(
                        'CURRENT ROLE',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.outline,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildRoleButton(context, 'Farmer', isSelected: true),
                            _buildRoleButton(context, 'Analyst', isSelected: false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Managed Plots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Managed Plots',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                onPressed: _showAddPlotDialog,
                icon: const Icon(Icons.add),
                label: const Text('New Plot'),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          Column(
            children: [
              ..._plots.asMap().entries.map((entry) {
                int index = entry.key;
                var plot = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildPlotCard(
                    context,
                    index: index,
                    title: plot['title'],
                    status: plot['status'],
                    crop: plot['crop'],
                    size: plot['size'],
                    cropIcon: plot['cropIcon'],
                    image: plot['image'],
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 48),

          // Account Preferences
          Text(
            'Account Preferences',
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildSettingsCard(
            context,
            title: 'Alerts & Notifications',
            icon: Icons.notifications_active,
            items: [
              _buildToggleSetting(context, 'Weather Anomalies', 'Frost, severe storms, drought alerts', true),
              _buildToggleSetting(context, 'Crop Health Reports', 'Weekly AI analysis summaries', false),
            ],
          ),

          const SizedBox(height: 48),
          
          MaterialButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            color: theme.colorScheme.errorContainer,
            minWidth: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: theme.colorScheme.onErrorContainer),
                const SizedBox(width: 8),
                Text(
                  'Log Out',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String label, {required bool isSelected}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        boxShadow: isSelected ? [
          BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 10, offset: const Offset(0, 2)),
        ] : null,
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlotCard(BuildContext context, {required int index, required String title, required String status, required String crop, required String size, required IconData cropIcon, required String image}) {
    final theme = Theme.of(context);
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 32, offset: const Offset(0, 8)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryFixed,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            status.toUpperCase(),
                            style: theme.textTheme.labelSmall?.copyWith(color: AppColors.primaryContainer, fontWeight: FontWeight.bold, fontSize: 8),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _plots.removeAt(index);
                        });
                      }, 
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    _buildStat(crop, cropIcon: cropIcon),
                    const SizedBox(width: 24),
                    _buildStat('Size', textValue: size),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, {IconData? cropIcon, String? textValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Row(
          children: [
            if (cropIcon != null) ...[
              Icon(cropIcon, size: 16, color: Colors.brown.shade400),
              const SizedBox(width: 4),
            ],
            Text(textValue ?? label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingsCard(BuildContext context, {required String title, required IconData icon, required List<Widget> items}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary, size: 32),
              const SizedBox(width: 16),
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...items,
        ],
      ),
    );
  }

  Widget _buildToggleSetting(BuildContext context, String title, String subtitle, bool value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Switch(value: value, onChanged: (_) {}, activeThumbColor: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }

}
