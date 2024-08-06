import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/data/database.dart';
import 'package:uangkoo/model/categories.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isExpanse = true;
  int type = 2;
  final AppDb database = AppDb();
  TextEditingController categoryNameController = TextEditingController();

  // add to database
  Future insert(String name, int type) async {
    DateTime now = DateTime.now();
    database.into(database.categories).insertReturning(
        CategoriesCompanion.insert(
            name: name, type: type, createdAt: now, editedAt: now));
  }

  // select data
  // category nama yang di definisikan dari model
  Future<List<category>> getAllCategory(int type) async {
    return await database.getAllCategory(type);
  }

  //update
  Future update(int categoryId, String newName) async {
    return await database.updateCategory(categoryId, newName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(
                    value: isExpanse,
                    onChanged: (bool value) {
                      setState(() {
                        isExpanse = value;
                        type = value ? 2 : 1;
                      });
                    },
                    inactiveTrackColor: Colors.green[200],
                    inactiveThumbColor: Colors.green,
                    activeColor: Colors.red,
                  ),
                  IconButton(
                      onPressed: () {
                        openDialog(null);
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            FutureBuilder(
                future: getAllCategory(type),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 10,
                                child: ListTile(
                                  leading: (isExpanse == true)
                                      ? const Icon(
                                          Icons.upload,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.download,
                                          color: Colors.green,
                                        ),
                                  title: Text(snapshot.data![index].name),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          database.deleteCategory(snapshot.data![index].id);
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          openDialog(snapshot.data![index]);
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('No has data'),
                        );
                      }
                    } else {
                      return const Center(
                        child: Text('No  has Data'),
                      );
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }

  void openDialog(category? category) {
    if (category != null) {
      categoryNameController.text = category.name;
    }
    showDialog(
        context: context,
        builder: (BuildContext cotext) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (isExpanse) ? 'Add Expanse' : 'Add Income',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: (isExpanse) ? Colors.red : Colors.green),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: categoryNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      (category == null)
                          ? insert(categoryNameController.text, isExpanse ? 2 : 1)
                          : update(category.id, categoryNameController.text);
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                      setState(() {});
                      categoryNameController.clear();
                    },
                    child: const Text('Save'))
              ],
            ),
          );
        });
  }
}
