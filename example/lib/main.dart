import 'package:fit_or_scale/fit_or_scale.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitOrScale Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: FitOrScale(
                minWidth: 418,
                minHeight: 170,
                showSizeOverlay: true,
                child: Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          "My awesome picture",
                          style: Theme.of(context).textTheme.headline4,
                          maxLines: 1,
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        )
                      ]),
                      Image.asset(
                        "assets/images/image_300x100.jpeg",
                        width: 300,
                        height: 100,
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: FitOrScale(
                      minWidth: 184,
                      minHeight: 184,
                      showSizeOverlay: true,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.cyan),
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(8),
                            child: Column(children: [
                              Flexible(
                                  child: Image.asset(
                                "assets/images/image_300x300.jpeg",
                              )),
                              Text(
                                "Amazing picture",
                                style: Theme.of(context).textTheme.headline6,
                                maxLines: 1,
                              )
                            ])),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Flexible(
              child: Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: FitOrScale(
                      minWidth: 144,
                      minHeight: 192,
                      showSizeOverlay: true,
                      child: AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.lightGreen),
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(8),
                            child: Column(children: [
                              Flexible(
                                  child: Image.asset(
                                "assets/images/image_200x400.jpeg",
                              )),
                              Material(
                                color: Colors.transparent,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.thumb_down),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.star),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.thumb_up),
                                      ),
                                    ]),
                              ),
                            ])),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
