import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/cout_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen:false);
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Provider')),
      ),
      body: Center(child: Consumer<CountProvider>(builder: (context, value, child) {
        return Text(
          value.count.toString(),
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
