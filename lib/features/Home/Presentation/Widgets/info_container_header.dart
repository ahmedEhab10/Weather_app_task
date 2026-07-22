import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';

class InfoContainerHeader extends StatelessWidget {
  const InfoContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_rounded, color: ColorsManager.primary),
                const SizedBox(width: 6),
                Text(
                  'Dubai',
                  style: GoogleFonts.inter(
                    color: ColorsManager.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            Text(
              'United Arab Emirates',
              style: GoogleFonts.inter(
                color: ColorsManager.secondarytext,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(width: 6),
            Text(
              '03:29 AM',
              style: GoogleFonts.inter(
                color: ColorsManager.secondary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              '22 Jul, 2026',
              style: GoogleFonts.inter(
                color: ColorsManager.secondarytext,
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
