
import 'package:flutter/material.dart';
import 'package:tassist/core/models/khata.dart';
import 'package:tassist/theme/colors.dart';
import 'package:tassist/theme/dimensions.dart';
import 'package:intl/intl.dart';

var formatter = new DateFormat('dd-MM-yyyy');
// TODO
var numberFormatter = new NumberFormat('##,##,##,##,###.##', "en_US");


class KhataTile extends StatelessWidget {

  final Khata khata;

  
  
  KhataTile({this.khata});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spacer.top.xs,
      child: Card(
        margin: spacer.all.xs,
        child: ListTile(
          leading:
          IconSwitchKhata(khata: khata),
          
          title: Column(
           children: <Widget>[
             Row(
              children: <Widget>[
                Text(khata.partyname, style: Theme.of(context).textTheme.body1.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                )),
              ],
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(numberFormatter.format(khata.amount).toString(), style: Theme.of(context).textTheme.body1.copyWith(
                  color: TassistPrimary
                )),
                Text(formatter.format(khata.date).toString()),

              ],
            ),
            
            ]
         )
        ),
      ),      
    );
  }
}

// TODO
class IconSwitchKhata extends StatefulWidget {

    final Khata khata;
    IconSwitchKhata({this.khata});

  @override
  _IconSwitchKhataState createState() => _IconSwitchKhataState();
}

class _IconSwitchKhataState extends State<IconSwitchKhata> {

  @override
  Widget build(BuildContext context) {
 
  

    if (widget.khata.trantype == 'Lia') {

    
              return Container(
              child: Icon(Icons.arrow_downward),
              color: TassistWarning,
          );
          } else {
         return  Container(
              child: Icon(Icons.arrow_upward),
              color: TassistSuccess,
          );
          }
  }
}

