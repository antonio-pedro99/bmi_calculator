import 'package:bmi_calculator/data/models/person.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../data/local/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  late final Box<Person> records;

  ObjectBox._create(this.store) {
    records = Box<Person>(store);
  }

  static Future<ObjectBox> create() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final storageDirectory = p.join(documentDirectory.path, "local-storage");
    final store = await openStore(directory: storageDirectory);
    return ObjectBox._create(store);
  }

  Stream<List<Person>> getRecords() {
    final queryBuilder = records.query()..order(Person_.dataCreated);

    return queryBuilder
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  void saveRecord(Person person) {
    records.put(person);
  }

  void removeRecord(int recordId) {
    records.remove(recordId);
  }

  void removeAll() {
    records.removeAll();
  }

//experimental, do not use it!
  Stream<List<Person>> filterBy() {
    final queryBuilder = records.query();
    return queryBuilder
        .watch(triggerImmediately: true)
        .where((event) => false)
        .map((event) => event.find());
  }
}
