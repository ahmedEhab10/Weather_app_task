import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/Models/Statistics_continar_model.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';

class StatConainer extends StatelessWidget {
  const StatConainer({
    super.key,
    required this.statisticsContinarModel,
    required this.value,
  });
  final StatisticsContinarModel statisticsContinarModel;
  final String value;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? ColorsManager.darkCard : ColorsManager.lightBackground;
    final valueColor = isDark ? ColorsManager.darkText : ColorsManager.darkBackground;
    final labelColor = isDark ? ColorsManager.darkSubtitle : ColorsManager.secondarytext;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: cardColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: isDark
                ? ColorsManager.darkBorder.withOpacity(0.4)
                : const Color(0x19C3C6D7),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 24.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: ColorsManager.info,
              child: SvgPicture.asset(statisticsContinarModel.icon),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    statisticsContinarModel.name,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: labelColor,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$value${statisticsContinarModel.prsentpercentage ? '%' : ''} ',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      color: valueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
