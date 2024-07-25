import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/widget/income.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Income(
                        title: 'Income',
                        amount: '00000',
                        icon: Icon(
                            Icons.download,
                          color: Colors.green,
                        )
                    ),
                    SizedBox(width: 10,),
                    Income(
                        title: 'Expense',
                        amount: '00000',
                        icon: Icon(
                          Icons.upload,
                          color: Colors.red,
                        )
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Transaction',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: Container(
                    child: Icon(Icons.upload, color: Colors.red,),
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  title: Text('Rp. 00000'),
                  subtitle: const Text('Makan Siang'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete),),
                      const SizedBox(width: 3,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.edit),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
