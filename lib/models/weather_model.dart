class WeatherModel {
  final String cityName;
  final DateTime dateTime;
  final String image;
  final String weatherCondition;
  final double maxTemp;
  final double minTemp;
  final double Temp;
  final double maxwind;
  final double totalprecip_mm;
  final int avghumidity;
  final String monthName;
  final List<double> temp_c_for_hour_in_Day;
  final List<DateTime> time_for_hour_in_Day;
  final List<String> image_for_hour_in_Day;
  final List<String> day_name_in_month;
  final List<String> day_image_in_month;
  final List<double> day_max_temp_in_month;
  final List<double> day_min_temp_in_month;

  WeatherModel({
    required this.cityName,
    required this.dateTime,
    required this.maxTemp,
    required this.minTemp,
    required this.Temp,
    required this.maxwind,
    required this.totalprecip_mm,
    required this.image,
    required this.weatherCondition,
    required this.avghumidity,
    required this.monthName,
    required this.temp_c_for_hour_in_Day,
    required this.time_for_hour_in_Day,
    required this.image_for_hour_in_Day,
    required this.day_name_in_month,
    required this.day_image_in_month,
    required this.day_max_temp_in_month,
    required this.day_min_temp_in_month,
  });

  factory WeatherModel.fromJson(json) {
    DateTime dateTime = DateTime.parse(json['current']['last_updated']);
    String monthName = getMonthName(dateTime.month);

    return WeatherModel(
      cityName: json['location']['name'],
      dateTime: dateTime,
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      Temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxwind: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
      totalprecip_mm: json['forecast']['forecastday'][0]['day']
          ['totalprecip_mm'],
      avghumidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      monthName: monthName,
      temp_c_for_hour_in_Day: getTempInHour(json),
      time_for_hour_in_Day: getTimeInHour(json),
      image_for_hour_in_Day: getImageInHour(json),
      day_name_in_month: getDayName(json),
      day_image_in_month: getDayImage(json),
      day_max_temp_in_month: getDayMaxTemp(json),
      day_min_temp_in_month: getDayMinTemp(json),
    );
  }
}

//data in hour for today
List<double> getTempInHour(json) {
  List<dynamic> forecastHours = json['forecast']['forecastday'][0]['hour'];

  List<double> forecastTempList = [];

  for (var forecastHour in forecastHours) {
    double temp = forecastHour['temp_c'];
    forecastTempList.add(temp);
  }
  return forecastTempList;
}

List<DateTime> getTimeInHour(json) {
  List<dynamic> forecastHours = json['forecast']['forecastday'][0]['hour'];

  List<DateTime> forecastTempList = [];

  for (var forecastHour in forecastHours) {
    DateTime temp = DateTime.parse(forecastHour['time']);
    forecastTempList.add(temp);
  }
  return forecastTempList;
}

List<String> getImageInHour(json) {
  List<dynamic> forecastHours = json['forecast']['forecastday'][0]['hour'];

  List<String> forecastTempList = [];

  for (var forecastHour in forecastHours) {
    String temp = forecastHour['condition']['icon'];
    forecastTempList.add(temp);
  }
  return forecastTempList;
}

// convert number month to month name
String getMonthName(int month) {
  switch (month) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return "Unknown";
  }
}

List<String> getDayName(json) {
  List<dynamic> data = json['forecast']['forecastday'];
  List<String> days = [];
  for (var day in data) {
    days.add(day['date']);
  }
  return days;
}

List<String> getDayImage(json) {
  List<dynamic> data = json['forecast']['forecastday'];
  List<String> images = [];
  for (int i = 1; i < data.length; i++) {
    images.add(data[i]['day']['condition']['icon']);
  }
  return images;
}

List<double> getDayMaxTemp(json) {
  List<dynamic> data = json['forecast']['forecastday'];
  List<double> maxTemps = [];
  for (int i = 1; i < data.length; i++) {
    maxTemps.add(data[i]['day']['maxtemp_c']);
  }
  return maxTemps;
}

List<double> getDayMinTemp(json) {
  List<dynamic> data = json['forecast']['forecastday'];
  List<double> minTemps = [];
  for (int i = 1; i < data.length; i++) {
    minTemps.add(data[i]['day']['mintemp_c']);
  }
  return minTemps;
}
