import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:silma_connect/constant.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.icon,
      required this.hint,
      this.inputType,
      this.inputAction,
      required this.controller,
      required this.isPasswordfield})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool isPasswordfield;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFf6f7fb),
          border: Border.all(color: Color(0xFFcbcbcb)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            obscureText: isPasswordfield,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}

class TextInputWithIcon extends StatefulWidget {
  const TextInputWithIcon({
    Key? key,
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  State<TextInputWithIcon> createState() => _TextInputWithIconState();
}

class _TextInputWithIconState extends State<TextInputWithIcon> {
  String countryHere = "Burkina Faso (BF)";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCountryPicker(
          context: context,
          // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            print('Select country: ${country.displayName}');
            setState(() {
              countryHere = country.displayNameNoCountryCode;
            });
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: height(context) * 0.08,
          width: width(context) * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFcbcbcb)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        setState(() {
                          countryHere = country.displayNameNoCountryCode;
                        });
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      widget.icon,
                      size: 35,
                      color: Color(0xFFcbcbcb),
                    ),
                  ),
                ),
                hintText: countryHere,
                hintStyle: kBodyText,
              ),
              style: kBodyText,
              keyboardType: widget.inputType,
              textInputAction: widget.inputAction,
            ),
          ),
        ),
      ),
    );
  }
}
