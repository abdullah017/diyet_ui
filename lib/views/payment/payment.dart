import 'package:fit_diyet/model/seance_model.dart';
import 'package:fit_diyet/widgets/arrow_back_appbar.dart';
import 'package:flutter/material.dart';

class PaymentViews extends StatefulWidget {
  final Seance seanceModel;
  final String paymentInfo;

  const PaymentViews({Key key, this.seanceModel, this.paymentInfo})
      : super(key: key);
  @override
  _PaymentViewsState createState() => _PaymentViewsState();
}

class _PaymentViewsState extends State<PaymentViews> {
  Seance seanceModel;
  @override
  void initState() {
    seanceModel = widget.seanceModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: arrowBackAppBar(context),
        body: Center(
          child: Container(
            child: Text('${widget.seanceModel}'),
          ),
        ),
      ),
    );
  }
}
