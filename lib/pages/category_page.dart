import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isExpase = true;
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
                      value: isExpase,
                      onChanged: (bool value) {
                        setState(() {
                          isExpase = value;
                        });
                      },
                    inactiveTrackColor: Colors.green[200],
                    inactiveThumbColor: Colors.green,
                    activeColor: Colors.red,
                  ),
                  IconButton(
                      onPressed: (){
                        openDiaalog();
                      },
                      icon: Icon(
                          Icons.add
                      )
                  )
                ],
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                leading: (isExpase == true) ? Icon(Icons.upload, color: Colors.red,) : Icon(Icons.download, color: Colors.green,),
                title: Text('Makan Siang'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete),),
                    const SizedBox(width: 3,),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openDiaalog() {
    showDialog(context: context, builder: (BuildContext cotext) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (isExpase) ? 'Add Expanse' : 'Add Income',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: (isExpase) ? Colors.red : Colors.green
              ),
            ),
            const SizedBox(height: 10,),
            TextField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name'
            ),),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () {}, child: Text('Save'))
          ],
        ),
      );
    });
  }
}
