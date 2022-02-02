import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {


    const SearchDialog(this.initialText);

    final String initialText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 4,
          left: 6, 
          right: 6,
          child: Card(
            child: TextFormField(
              initialValue: initialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ),

                onFieldSubmitted: (text){
                  Navigator.of(context).pop(text);
                },
            ),
          ),
        )
      ],
    );
  }
}
