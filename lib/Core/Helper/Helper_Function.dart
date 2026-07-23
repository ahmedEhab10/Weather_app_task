import 'package:intl/intl.dart';

abstract class helperFunction {
  static String getweatherimage(String weathercondition) {
    String image = '';
    if (weathercondition == 'Clouds') {
      image = 'assets/images/Day Clouds.png';
    } else if (weathercondition == 'Rain') {
      image = 'assets/images/Day Rain.png';
    } else if (weathercondition == 'Snow') {
      image = 'assets/images/Day Snow.png';
    } else if (weathercondition == 'Patchy rain nearby') {
      image = 'assets/images/Day Rain.png';
    } else if (weathercondition == 'Light rain') {
      image = 'assets/images/Day Rain.png';
    } else if (weathercondition == 'Severe sandstorm') {
      image = 'assets/images/Day Wind.png';
    } else if (weathercondition == 'Drizzle') {
      image = 'assets/drizzle.svg';
    } else if (weathercondition == 'Haze') {
      image = 'assets/images/Day Wind.png';
    } else if (weathercondition == 'Partly Cloudy') {
      image = 'assets/images/Day Clouds.png';
    } else if (weathercondition == 'Smoke') {
      image = 'assets/smoke.svg';
    } else if (weathercondition == 'Dust') {
      image = 'assets/dust.svg';
    } else if (weathercondition == 'Sand') {
      image = 'assets/sand.svg';
    } else if (weathercondition == 'Ash') {
      image = 'assets/images/Day Sun.png';
    } else {
      image = 'assets/images/Day Sun.png';
    }
    return image;
  }

  static String formatTime({required String dateTime}) {
    final date = DateTime.parse(dateTime);
    return DateFormat('hh:mm a').format(date);
  }

  static String formatDate({required String dateTime}) {
    final date = DateTime.parse(dateTime);
    return DateFormat('dd MMM, yyyy').format(date);
  }
}
