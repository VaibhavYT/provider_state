import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/slider_provider.dart';

class MultiHome extends StatefulWidget {
  const MultiHome({super.key});

  @override
  State<MultiHome> createState() => _MultiHomeState();
}

class _MultiHomeState extends State<MultiHome> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    print('whole');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Multi Provider'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Slider(
                value: value.value,
                min: 0,
                max: 1,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            }),
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: const Center(child: Text('Container 1')),
                    ),
                  ),
                ],
              );
            }),
            
          ],
        ));
  }
}
