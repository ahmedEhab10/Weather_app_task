import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/Helper/Helper_Function.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';
import 'package:weather_app/features/Home/domain/Entity/Weather_Entity.dart';

class InfoContainerHeader extends StatelessWidget {
  final WeatherEntity weatherEntity;
  const InfoContainerHeader({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subtitleColor = isDark
        ? ColorsManager.darkSubtitle
        : ColorsManager.secondarytext;
    final String time = helperFunction.formatTime(
      dateTime: weatherEntity.last_updated,
    );
    final String date = helperFunction.formatDate(
      dateTime: weatherEntity.last_updated,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_rounded, color: ColorsManager.primary),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      maxLines: 1,

                      weatherEntity.country,
                      style: GoogleFonts.inter(
                        color: ColorsManager.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              Text(
                weatherEntity.cityName,
                style: GoogleFonts.inter(
                  color: subtitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 6),
            Text(
              time,
              style: GoogleFonts.inter(
                color: isDark
                    ? ColorsManager.darkText
                    : ColorsManager.secondary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              date,
              style: GoogleFonts.inter(
                color: subtitleColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
