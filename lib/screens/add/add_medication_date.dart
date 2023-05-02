import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AddAds extends StatelessWidget {
  const AddAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Ads'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
                  child: SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset('assets/images/login.svg'),
                      )
                  ),
                ),

                SizedBox(height: size.height * 0.04),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Store Name',
                    prefixIcon: Icon(Icons.store),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    labelText: 'Price',
                    prefixIcon: Icon(Icons.price_change_outlined),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Day'),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('End Day'),
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Your Location'),
                  ),
                ),

                SizedBox(height: size.height * 0.08),

                //تاكيد
                SizedBox(
                  width: size.width,
                  height: size.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
