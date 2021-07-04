import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:myapp/laster/table.dart';
import '../base/constant.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

void main() => runApp(CarouselDemo());

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/fullscreen', routes: {
      '/fullscreen': (ctx) => FullscreenSlider(),
    });
  }
}

class FullscreenSlider extends StatefulWidget {
  @override
  FullscreenSliderDemo createState() {
    return FullscreenSliderDemo();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.

class FullscreenSliderDemo extends State<FullscreenSlider> {
  var _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View')),
      body: Builder(
        builder: (context) {
          final double height = MaxSize.height;
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                      height: 0.8 * height,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  // autoPlay: false,
                  carouselController: _controller,
                  items: [MyTable(), Text("eee"), Text("fff")],
                  // items: imgList
                  //     .map((item) => Container(
                  //           child: Center(
                  //               child: Image.network(
                  //             item,
                  //             fit: BoxFit.cover,
                  //             height: height,
                  //           )),
                  //         ))
                  //     .toList(),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          fixedSize:
                              Size(MaxSize.width * 0.3, MaxSize.height * 0.05),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: Text(
                        '0',
                        style: TextStyle(
                            color:
                                (_current == 0) ? Colors.black : Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _current = 0;
                          _controller.animateToPage(_current,
                              duration: Duration(seconds: 1));
                        });

                        // To do
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          fixedSize:
                              Size(MaxSize.width * 0.3, MaxSize.height * 0.05),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: Text(
                        '1',
                        style: TextStyle(
                            color:
                                (_current == 1) ? Colors.black : Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _current = 1;
                          _controller.animateToPage(_current,
                              duration: Duration(seconds: 1));
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          fixedSize:
                              Size(MaxSize.width * 0.3, MaxSize.height * 0.05),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: Text(
                        '1',
                        style: TextStyle(
                            color:
                                (_current == 2) ? Colors.black : Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _current = 2;
                          _controller.animateToPage(_current,
                              duration: Duration(seconds: 1));
                        });
                      },
                    ),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Validate returns true if the form is valid, or false otherwise.
                //   },
                //   child: Text('PAGE1'),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
