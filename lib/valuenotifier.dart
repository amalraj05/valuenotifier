import 'package:flutter/material.dart';

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),debugShowCheckedModeBanner: false,
    );
  }
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _counter =ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("Value Notifier",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
           builder: (context, value, _) {
            return Text("COUNT: $value",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
           }
           ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 200,right: 130),
        child: FloatingActionButton(
          onPressed: () {
            _counter.value++;
          },
          child: Icon(Icons.add),
          ),
      ),
    );
  }
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}