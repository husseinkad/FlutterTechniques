import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_pref/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StoreController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<StoreController>(context).loadCounter();
    return Consumer<StoreController>(
    builder: (context, storeController, child) => Scaffold(
        appBar: AppBar(
          title: const Text('counter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      storeController.decrementCounter();
                    },
                    tooltip: 'Remove',
                    child: const Icon(Icons.remove),
                  ),
                  Text(
                    storeController.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                   FloatingActionButton(
                    onPressed: () {
                      storeController.incrementCounter();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),

                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            storeController.removeCounter();
          },
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
      ),
    );
  }
}





