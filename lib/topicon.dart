import 'package:flutter/material.dart';
class topIcon extends StatelessWidget {
  topIcon({required IconData this.icon,required AlignmentGeometry this.align, void Function()? this.onpressed,
    super.key,
  });
  IconData icon;
  AlignmentGeometry align;
  void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(padding: EdgeInsets.only(right: 10,left: 10,top: 5,),
        alignment: align,
        child: Icon( icon,size: 60,color: Colors.yellow[300],),
      ),
    );
  }
}