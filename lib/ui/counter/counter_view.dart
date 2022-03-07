import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/ui/counter/counter_view_model.dart';

class CounterView extends StatelessWidget {

  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CounterViewModel>.reactive(
        viewModelBuilder:() => CounterViewModel(),
        builder: (context,model,child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text('Counter'),
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => ZoomDrawer.of(context)!.toggle()
            ),
          ),
          body: Center(child: Text(
              model.title
          ),),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.updateCounter,),
        ),
    );
  }
}
