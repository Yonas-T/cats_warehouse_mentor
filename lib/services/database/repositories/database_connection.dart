import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqflite');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE notificationdata(id INTEGER PRIMARY KEY ,read TEXT,created_at TEXT,title TEXT,body TEXT,date TEXT)");
    await database.execute(
    "CREATE TABLE dispatch(id INTEGER PRIMARY KEY ,reference_no TEXT,allocation_item_id TEXT,transporter_id TEXT,transporter_name TEXT,plate_no TEXT,driver_name TEXT,driver_phone TEXT,quantity INTEGER,remark TEXT,prepared_by_id TEXT,prepared_by_email TEXT,dispatch_status TEXT,destination TEXT)");
    await database.execute(
        "CREATE TABLE receipt(commodity_status TEXT,dispatch_id TEXT,quantity INTEGER, remark TEXT,prepared_by_id TEXT)");
  }
}
