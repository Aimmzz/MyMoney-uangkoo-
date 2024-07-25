import 'package:drift/drift.dart';

@DataClassName('category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 128)();
  IntColumn get type  => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get editedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}