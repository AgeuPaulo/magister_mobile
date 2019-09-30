import 'package:flutter/material.dart';

Widget menuCard(IconData icon, String nome, Color color, Widget proximo, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    )),
    color: color,
    margin: EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
         Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => proximo,
         ));
      },
      splashColor: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: 80.0,
              color: Colors.white,
            ),
            Text(
              nome.toUpperCase(),
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buttonSave(
    Color color, Color color2, BuildContext context, Function onPressed) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 32,
      right: 32,
      top: 16,
    ),
    child: Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [color, color2],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: FlatButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          "Salvar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    ),
  );
}

Widget formField(TextEditingController controller, String label, IconData icon,
    TextInputType type, Color color, {String initialValue}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 1),
      ),
      child: Theme(
        data: new ThemeData(
            primaryColor: color,
            accentColor: color,
            hintColor: color),
        child: TextFormField(
          keyboardType: type,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(icon),
            labelText: label.toUpperCase(),
            labelStyle: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Campo em branco!';
            }
          },
        ),
      ),
    ),
  );
}
