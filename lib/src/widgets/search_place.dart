import 'package:flutter/material.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: 'Buscar',
            ),
          ),
        ),
      ),
    );
  }
}
