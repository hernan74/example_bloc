import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final double altoCampo;
  final double anchoCampo;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final String textoErrorValidacion;

  final TextEditingController? controller;

  const TextfieldWidget(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.altoCampo,
      required this.anchoCampo,
      this.textInputType = TextInputType.number,
      this.inputFormatters,
      this.controller,
      this.onChanged,
      required this.textoErrorValidacion})
      : super(key: key);

  @override
  _TextfieldWidgetState createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: widget.anchoCampo,
      height: widget.altoCampo,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          if (widget.textoErrorValidacion.isNotEmpty)
            Positioned(
              top: widget.altoCampo * 3 / 100,
              right: widget.anchoCampo * 0.5 / 100,
              child: Icon(
                Icons.cancel_outlined,
                size: widget.altoCampo * 33 / 100,
                color: const Color(0xffD94D4D),
              ),
            ),
          Theme(
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              inputFormatters: widget.inputFormatters,
              onChanged: widget.onChanged?.call,
              style: TextStyle(fontSize: size.height * 2 / 100),
              decoration: _buildInputDecoration(size),
            ),
            data: Theme.of(context).copyWith(
              primaryColor: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(Size size) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _determinarColor(widget.textoErrorValidacion))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _determinarColor(widget.textoErrorValidacion),
                width: 2)),
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: _determinarColor(widget.textoErrorValidacion),
            fontSize: widget.altoCampo * 30 / 100),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        errorStyle: const TextStyle(fontSize: 0),

        ///Quita el contador de caracteres faltantes para el [maxLength]
        counterText: "");
  }

  Color _determinarColor(String msjError) {
    return msjError.isEmpty ? Colors.blueAccent : const Color(0xffD94D4D);
  }
}
