import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60.0,
        backgroundColor: Colors.white,
        leading: Tooltip(
          message: 'Sair',
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 48.0,
                right: 10.0,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite o contato',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      prefixIcon: const Icon(Icons.search_sharp),
                      prefixIconColor: Colors.grey,
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    onTapOutside: (_) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
