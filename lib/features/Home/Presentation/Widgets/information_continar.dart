import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Core/resources/Colors_Manager.dart';
import 'package:weather_app/features/Home/Presentation/Widgets/info_container_header.dart';

class InformationContinar extends StatelessWidget {
  const InformationContinar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,

      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color:
            ColorsManager.lightBackground, //Color.fromARGB(255, 235, 233, 233),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0x19C3C6D7)),
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
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
            InfoContainerHeader(),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '33°C',
                  style: GoogleFonts.inter(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondary,
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
                        image: AssetImage('assets/images/Day Storm.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Text(
              'Hazy',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorsManager.secondary,
              ),
            ),

            Text(
              'Feels like 45.8°C',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorsManager.secondarytext,
              ),
            ),
            Spacer(),
            Text(
              'Last updated 03:15 AM',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorsManager.lightSubtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
