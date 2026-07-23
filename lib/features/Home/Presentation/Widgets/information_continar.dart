import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/Helper/Helper_Function.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/info_container_header.dart';
import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';

class InformationContinar extends StatelessWidget {
  const InformationContinar({super.key, required this.weatherEntity});
  final WeatherEntity weatherEntity;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? ColorsManager.darkCard : ColorsManager.lightBackground;
    final primaryTextColor = isDark ? ColorsManager.darkText : ColorsManager.secondary;
    final subtitleColor = isDark ? ColorsManager.darkSubtitle : ColorsManager.secondarytext;
    final lastUpdatedColor = isDark ? ColorsManager.darkHint : ColorsManager.lightSubtitle;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
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
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 24.0,
            spreadRadius: 2.0,
            offset: Offset(4.0, 14.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 24.0,
          bottom: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoContainerHeader(weatherEntity: weatherEntity),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '${weatherEntity.tempC}°C',
                  style: GoogleFonts.inter(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Container(
                    width: 110,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          helperFunction.getweatherimage(
                            weatherEntity.condition,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Text(
              weatherEntity.condition,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
              ),
            ),

            Text(
              'Feels like ${weatherEntity.feelsLikeC}°C',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: subtitleColor,
              ),
            ),
            const Spacer(),
            Text(
              'Last updated 03:15 AM',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: lastUpdatedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

