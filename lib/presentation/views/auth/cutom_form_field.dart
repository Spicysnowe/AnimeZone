import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final String? labelText;
   final FocusNode? focusNode; 
  DetailsTextField(
      {super.key,
      this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.labelText,
      this.maxLength,
      this.maxLengthEnforcement,
      this.onSaved,
      this.validator, this.focusNode});

  @override
  State<DetailsTextField> createState() => _DetailsTextFieldState();
}

class _DetailsTextFieldState extends State<DetailsTextField> {
  bool _isObscured = true;
   FocusNode? _internalFocusNode;

  @override
  void initState() {
    super.initState();
    // Initialize _internalFocusNode if widget.focusNode is null
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }
  }

  @override
  void dispose() {
    // Only dispose _internalFocusNode, widget.focusNode is managed by the parent
    _internalFocusNode?.dispose();
    super.dispose();
  }


  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(45, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: black2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        focusNode: widget.focusNode ?? _internalFocusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength, 
        inputFormatters: widget.inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.getFont(fontFamily1,
            fontSize: scaleHeight(10, context),
            fontWeight: FontWeight.w400,
            color: Colors.white),
        validator: widget.validator,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          prefixIcon: TextInputType.visiblePassword == widget.keyboardType
              ? const Icon(Icons.lock, size: 20,)
              : const Icon(Icons.email, size: 20),
          suffixIcon: TextInputType.visiblePassword == widget.keyboardType
              
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                     size: 20
                  ),
                  onPressed: _togglePasswordVisibility,
                ): null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          hintText: widget.labelText,
          counterText: '',
          hintStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.white;
              return GoogleFonts.getFont(fontFamily1,
                  fontSize: scaleHeight(10, context),
                  fontWeight: FontWeight.w400,
                  color: color);
            },
          ),
          
          labelStyle: GoogleFonts.getFont(fontFamily1,
              fontSize: scaleHeight(10, context),
              fontWeight: FontWeight.w400,
              color: Colors.white),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: black2, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: grey, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          // errorBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.red, width: 1.0),
          //     borderRadius: BorderRadius.all(Radius.circular(AppRadius.rad5))),
          // focusedErrorBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.red, width: 1.0),
          //     borderRadius: BorderRadius.all(Radius.circular(AppRadius.rad5))),
        ),
      ),
    );
  }
}
