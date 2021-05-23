import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider3_hassan/myProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MyProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider3(),
    ),
  ));
}

class Provider3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<MyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 3'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Times'),
            Text(
              '${Provider.of<MyProvider>(context, listen: true).count}',
              style: TextStyle(fontSize: 46),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Times 2'),
            Consumer<MyProvider>(
                builder: (ctx, value, child) => Text(
                      '${value.count}',
                      style: TextStyle(fontSize: 46),
                    )),
            SizedBox(
              height: 12,
            ),
            Text('Times 3'),
            Text(
              '${context.watch<MyProvider>().count}',
              style: TextStyle(fontSize: 46),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Times 4'),
           Selector<MyProvider,int>(
               selector:(ctx,val)=>val.count ,
             builder: (ctx,val,child)=>Text('$val',style: TextStyle(fontSize: 44),),),

            SizedBox(
              height: 12,
            ),
            Text('Times 5'),
            Selector<MyProvider,int>(
              selector:(ctx,val)=>val.num ,
              builder: (ctx,val,child)=>Text('$val',style: TextStyle(fontSize: 44),),),

          SizedBox(height: 10,),
            Text('Times 5 selector '),
            Text('${context.select<MyProvider,int>((value) => value.num)}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MyProvider>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
