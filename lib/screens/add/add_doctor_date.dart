import 'package:flutter/material.dart';

class AddShift extends StatelessWidget {
  const AddShift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shift'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //وقت البداية
              const Text('Time'),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Time'),
                ),
              ),

              SizedBox(height: size.height * 0.08),

              //وقت البداية
              const Text('Date'),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Date'),
                ),
              ),

              SizedBox(height: size.height * 0.08),

              //تاكيد
              SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
