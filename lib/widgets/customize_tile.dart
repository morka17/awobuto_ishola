import 'package:flutter/material.dart';

class CustomizeTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function ontap;

  const CustomizeTile({this.icon, this.text, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(9.0, 0.0, 9.0, 0.0),
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap:ontap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey),),
          ),
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Icon(icon,
                  color:Colors.white54,
                  ),
                  Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}