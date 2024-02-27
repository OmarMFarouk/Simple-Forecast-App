import 'dart:io';

import 'package:public_ip_address/public_ip_address.dart';

class CityHelper {
  getCityName() async {
    String ip = await IpAddress.getIp();
    String cityName = await IpAddress.getCityFor(ip);

    return cityName;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
