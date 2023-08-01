import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label ;
  const MyButton({Key? key,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width*0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black

      ),
      child:Text( label,
          style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700)
      ),
    );
  }
}
