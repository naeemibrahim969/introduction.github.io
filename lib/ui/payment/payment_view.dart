import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/ui/payment/payment_view_model.dart';

class PaymentView extends StatelessWidget {

  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentViewModel>.reactive(
      viewModelBuilder:() => PaymentViewModel(),
      builder: (context,model,child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Payment'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => ZoomDrawer.of(context)!.toggle()
          ),
        ),
        body: Center(child: Text(
            "Payment"
        ),),
      ),
    );
  }
}
