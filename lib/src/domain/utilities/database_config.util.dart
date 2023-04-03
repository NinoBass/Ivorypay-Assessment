import 'package:hive_flutter/hive_flutter.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConfig {
  DatabaseConfig._();

  static Future<void> initializeHive() async {
    //Get application directory (storage directory on device)
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    // Open all hive boxes here
    await Hive.openBox<String?>(walletKey);
  }
}
