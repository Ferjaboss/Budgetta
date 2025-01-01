import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';
class FirstSettings extends StatefulWidget {
  @override
  State<FirstSettings> createState() => _FirstSettingsState();
}

class _FirstSettingsState extends State<FirstSettings> {
  String _currency = 'TND';
  String _Country = 'es';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 58, left: 70, right: 70),
            child: Image(image: AssetImage('assets/images/Logo.png')),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    "Your Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'sf-text',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: const Offset(12, 26),
                          blurRadius: 50,
                          spreadRadius: 0,
                          color: Colors.grey.withOpacity(.1)),
                    ]),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Foulen Ben Foulen',
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.75)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    "Your Currency",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'sf-text',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: const Offset(12, 26),
                          blurRadius: 50,
                          spreadRadius: 0,
                          color: Colors.grey.withOpacity(.1)),
                    ]),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        showCurrencyPicker(
                          context: context,
                          showFlag: true,
                          showSearchField: true,
                          showCurrencyName: true,
                          showCurrencyCode: true,
                          favorite: ['tnd'],
                          onSelect: (Currency currency) {
                            setState(() {
                              this._currency = currency.code;
                            });
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.currency_exchange,
                              color: Colors.black, size: 20),
                          Text('$_currency',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'sf-text',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              )),
                          Image.asset(
                            'assets/images/currency_flags/${_currency.toLowerCase()}.png',
                            height: 35,
                            width: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        onPressed: () {
          print("btn bottom pressed");
          Navigator.pop(context);
          Navigator.pushNamed(context, '/dashboard');
        },
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
      ),
    );
  }
}
