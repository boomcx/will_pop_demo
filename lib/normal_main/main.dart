import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pop_scope_page_transitions/pop_scope_page_transitions.dart';
import 'package:will_pop_demo/widgets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: PopScopePageTransitionsBuilder(),
            TargetPlatform.iOS: PopScopePageTransitionsBuilder(),
          },
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WillPopScope'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/second');
          },
          child: const Text('push'),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PopScopeAppBar(
        title: 'SecondPage',
        onPopInvokedWithResult: (didPop, result) {
          print(
              ' SecondPage `onPopInvokedWithResult` didPop: $didPop, result: $result');
          if (didPop) {
            return;
          }

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('WillPopScope'),
                content: const Text('WillPopScope'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                    },
                  )
                ],
              );
            },
          );
          //
        },
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
            child: const Text('push'),
          ),
          ElevatedButton(
            onPressed: () async {
              // maybePop will trigger `PopScope`'s `onPopInvokedWithResult`
              // final maybePop = await Navigator.maybePop(context);
              // print(maybePop);

              // do pop page
              Navigator.pop(context);
            },
            child: const Text('pop'),
          ),
          // const CupertinoTextField(
          //   placeholder: 'input  something...',
          // )
        ],
      ),
    );
  }
}
