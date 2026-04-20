import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          
          Text(
            'North Field, Sector B',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Lat: 45.1234, Long: -93.4567',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),

          // Hero Card
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuA8ElaNkv71wxMGh38m_31iuRjC3xYYhUxuyU2ZY8dyNA7hu7Tm1U6-O3C7Mh2R7D7h33CAsYf8Wfqw6tQmkGILVmWYUEuqk54VOW-hd8-KNzoNKqvcCuh_rvbERlRKNG7-tvnoK8gc9r0sPU6Entb_TK9EtV4d8oep9N_ZDnpByWLsKvz37N5MFHY9E63C47lH6rD3yyyxTnbWUsRfvqrAUFrXH1AYmuoPbvHwMCxUgDXxeCjIcsF6Ib01t-sQNBgag5fFTxI-rpTF',
                    fit: BoxFit.cover,
                    color: Colors.black.withAlpha(100),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withAlpha(150),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withAlpha(50)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'CURRENT',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          '72°',
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 56,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.wb_cloudy, color: theme.colorScheme.secondary),
                            const SizedBox(width: 8),
                            Text(
                              'Partly Cloudy',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
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
          const SizedBox(height: 24),

          // Smart Recommendation
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.tertiaryFixed,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.tertiaryFixedDim.withAlpha(50)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning, color: AppColors.tertiary, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Smart Recommendation',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.tertiaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'High wind speeds expected Tuesday. Secure young saplings now.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.onTertiaryFixed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Data Grids
          GridView.count(
            crossAxisCount: 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            children: [
              _buildChartCard(
                context,
                title: 'Temperature',
                icon: Icons.thermostat,
                child: CustomPaint(
                  size: const Size(double.infinity, 100),
                  painter: LineChartPainter(theme.colorScheme.primary),
                ),
              ),
              _buildChartCard(
                context,
                title: 'Precipitation',
                icon: Icons.water_drop,
                iconColor: theme.colorScheme.secondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBar(0.2, theme.colorScheme.secondaryContainer),
                    _buildBar(0.5, theme.colorScheme.secondaryContainer),
                    _buildBar(0.8, theme.colorScheme.secondaryContainer),
                    _buildBar(0.3, theme.colorScheme.secondaryContainer),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Detailed Metrics
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Conditions',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildMetricItem(context, Icons.air, 'Wind Speed', '14 mph SE'),
                _buildMetricItem(context, Icons.water_drop, 'Humidity', '64%'),
                _buildMetricItem(context, Icons.compress, 'Pressure', '29.92 inHg', showDivider: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(BuildContext context, {required String title, required IconData icon, Color? iconColor, required Widget child}) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceContainerHighest.withAlpha(50)),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 20, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(icon, color: iconColor ?? theme.colorScheme.onSurfaceVariant),
            ],
          ),
          const Expanded(child: SizedBox()),
          SizedBox(height: 120, child: child),
          const SizedBox(height: 20), // Padding for X labels
        ],
      ),
    );
  }

  Widget _buildBar(double heightFactor, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${(heightFactor * 100).toInt()}%',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 120 * heightFactor,
          decoration: BoxDecoration(
            color: color.withAlpha(200),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricItem(BuildContext context, IconData icon, String label, String value, {bool showDivider = true}) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 12),
              Text(label, style: theme.textTheme.bodyLarge),
              const Spacer(),
              Text(value, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        if (showDivider)
          Divider(color: AppColors.surfaceContainerHighest.withAlpha(100)),
      ],
    );
  }
}

class LineChartPainter extends CustomPainter {
  final Color color;
  LineChartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    
    // Explicit points along the line chart
    final p1 = Offset(0, size.height * 0.6);
    final p2 = Offset(size.width * 0.5, size.height * 0.7);
    final p3 = Offset(size.width, size.height * 0.3);

    path.moveTo(p1.dx, p1.dy);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.4, p2.dx, p2.dy);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9, p3.dx, p3.dy);

    canvas.drawPath(path, paint);
    
    // Draw circles at key nodes
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
      
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    _drawNodeAndText(canvas, p1, '28°', fillPaint, dotPaint, color);
    _drawNodeAndText(canvas, p2, '24°', fillPaint, dotPaint, color);
    _drawNodeAndText(canvas, p3, '32°', fillPaint, dotPaint, color);
  }

  void _drawNodeAndText(Canvas canvas, Offset offset, String text, Paint fill, Paint dot, Color textColor) {
    canvas.drawCircle(offset, 6, fill);
    canvas.drawCircle(offset, 3, dot);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    
    // Align text centered above the node
    double textX = offset.dx - (textPainter.width / 2);
    // Boundary check for first/last text to not be cut off
    if (textX < 0) textX = 0;
    
    textPainter.paint(canvas, Offset(textX, offset.dy - textPainter.height - 8));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
