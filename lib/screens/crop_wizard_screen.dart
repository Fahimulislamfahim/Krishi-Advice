import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CropWizardScreen extends StatefulWidget {
  const CropWizardScreen({super.key});

  @override
  State<CropWizardScreen> createState() => _CropWizardScreenState();
}

class _CropWizardScreenState extends State<CropWizardScreen> {
  int _currentStep = 1;
  final int _totalSteps = 4;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // Progress and Back Button
          Positioned(
            top: 64,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(_totalSteps, (index) {
                    final stepIndex = index + 1;
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: index == _totalSteps - 1 ? 0 : 8),
                        height: 4,
                        decoration: BoxDecoration(
                          color: stepIndex <= _currentStep ? theme.colorScheme.primary : theme.colorScheme.primary.withAlpha(50),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),
                IconButton(
                  onPressed: () {
                    if (_currentStep > 1) {
                      setState(() => _currentStep--);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainerLowest,
                    shadowColor: Colors.black.withAlpha(10),
                    elevation: 8,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step $_currentStep of $_totalSteps',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getStepTitle(),
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getStepSubtitle(),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 48),
                  _buildStepContent(),
                ],
              ),
            ),
          ),

          // Bottom Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
              decoration: BoxDecoration(
                color: AppColors.surface.withAlpha(230),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 32, offset: const Offset(0, -8)),
                ],
              ),
              child: MaterialButton(
                onPressed: () {
                  if (_currentStep < _totalSteps) {
                    setState(() => _currentStep++);
                  } else {
                    Navigator.pop(context);
                  }
                },
                height: 64,
                color: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                elevation: 0,
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.colorScheme.primary, theme.colorScheme.primaryContainer],
                    ),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentStep == _totalSteps ? 'Finish' : 'Continue',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getStepTitle() {
    switch (_currentStep) {
      case 1: return 'Where is your field located?';
      case 2: return 'What are you planting?';
      case 3: return 'Field Size & Area';
      case 4: return 'Soil Analysis & History';
      default: return '';
    }
  }

  String _getStepSubtitle() {
    switch (_currentStep) {
      case 1: return 'We use this to analyze local climate data and determine regional crop suitability.';
      case 2: return 'Tell us which crops you are planning to grow this season.';
      case 3: return 'Specify the acreage of your cultivation area for accurate reports.';
      case 4: return 'Upload a soil test or provide previous crop history.';
      default: return '';
    }
  }

  Widget _buildStepContent() {
    final theme = Theme.of(context);
    switch (_currentStep) {
      case 1:
        return Column(
          children: [
            _buildOption(
              context,
              title: 'Use current location',
              subtitle: 'Accurate to 10 meters',
              icon: Icons.my_location,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider(color: theme.colorScheme.surfaceContainerHighest)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('OR', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.outline)),
                ),
                Expanded(child: Divider(color: theme.colorScheme.surfaceContainerHighest)),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.surfaceContainerLow,
                hintText: 'Enter zip code or region',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            _buildOption(context, title: 'Rice - BRRI Dhan 28', subtitle: 'Most popular for Boro season', icon: Icons.eco),
            const SizedBox(height: 16),
            _buildOption(context, title: 'Wheat - BARI Gom 33', subtitle: 'Zinc enriched variety', icon: Icons.grass),
            const SizedBox(height: 16),
            _buildOption(context, title: 'Maize - BHM 14', subtitle: 'Hybrid high-yielding variety', icon: Icons.grain),
          ],
        );
      case 3:
        return Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.surfaceContainerLow,
                hintText: 'Enter acreage (e.g. 1.5)',
                suffixText: 'Acres',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              ),
            ),
          ],
        );
      case 4:
        return Column(
          children: [
            _buildOption(context, title: 'Upload Soil Report', subtitle: 'PDF or Image from lab', icon: Icons.upload_file),
            const SizedBox(height: 16),
            _buildOption(context, title: 'Manual Entry', subtitle: 'Enter Nitrogen, PH, etc.', icon: Icons.edit_note),
          ],
        );
      default:
        return Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.colorScheme.outlineVariant.withAlpha(50)),
          ),
          child: Column(
            children: [
              Icon(Icons.auto_awesome, size: 48, color: theme.colorScheme.primaryContainer),
              const SizedBox(height: 16),
              Text(
                'Selection Details Coming in next prototype update',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        );
    }
  }

  Widget _buildOption(BuildContext context, {required String title, required String subtitle, required IconData icon}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 32, offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: theme.colorScheme.primary),
        ],
      ),
    );
  }
}
