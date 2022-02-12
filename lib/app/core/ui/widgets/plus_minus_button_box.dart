import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusButtonBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCall;
  final VoidCallback plussCall;
  final bool AllCalc;

  const PlusMinusButtonBox({
    Key? key,
    required this.quantity,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    required this.price,
    required this.minusCall,
    required this.plussCall,
    this.AllCalc = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Oculta o texto caso ele seja nulo
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                VakinhaRoundedButton(
                  onPressed: minusCall,
                  label: '-',
                ),
                Text('$quantity'),
                VakinhaRoundedButton(
                  label: '+',
                  onPressed: plussCall,
                ),
              ],
            ),
            Visibility(
              child: const Spacer(),
              visible: label == null,
            ),
            Container(
              //margin: const EdgeInsets.only(left: 5, right: 10),
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(
                FormatterHelper.formatCurrency(
                  AllCalc ? price * quantity : price,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
