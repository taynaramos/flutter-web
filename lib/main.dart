import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/400/400?random=1',
    'https://picsum.photos/400/400?random=2',
    'https://picsum.photos/400/400?random=3',
    'https://picsum.photos/400/400?random=4',
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery')),
      body:
          screenSize.width < 600
              ? ListView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.network(
                      imageUrls[index],
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              )
              : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenSize.width > 1200 ? 4 : 3,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.network(
                      imageUrls[index],
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),

      // ** Using LayoutBuilder to apply different layout based on screen size
      // LayoutBuilder(
      //   builder: (context, constraints) {
      //     if (constraints.maxWidth < 600) {
      //       return ListView(children: buildImageList());
      //     } else {
      //       return GridView.count(
      //         crossAxisCount: 3,
      //         children: buildImageList(),
      //       );
      //     }
      //   },
      // ),

      // ** Using MediaQuery to aplpy different layout based on screen size
      // Center(
      //   child:
      //       screenSize.width < 600
      //           ? Column(
      //             children: [
      //               Image.network('https://picsum.photos/200/200?random=1'),
      //               SizedBox(height: 20),
      //               Image.network('https://picsum.photos/200/200?random=2'),
      //             ],
      //           )
      //           : Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Image.network('https://picsum.photos/200/200?random=1'),
      //               SizedBox(width: 20),
      //               Image.network('https://picsum.photos/200/200?random=2'),
      //             ],
      //           ),
      // ),
    );
  }

  List<Widget> buildImageList() {
    return List.generate(12, (index) {
      return Image.network('https://picsum.photos/200/200?random=$index');
    });
  }
}
