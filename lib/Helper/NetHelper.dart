import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io'; // Add this import

class NetHelper
{
static  Future<bool> getConnectd()async
  {
    // Check the connectivity status
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No connectivity
      return false;
    }
    // Verify actual internet access
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}