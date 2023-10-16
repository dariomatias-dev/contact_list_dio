import 'package:flutter/material.dart';

class ResearchFieldWidget extends StatefulWidget {
  const ResearchFieldWidget({
    super.key,
    required this.search,
  });

  final void Function(String value) search;

  @override
  State<ResearchFieldWidget> createState() => _ResearchFieldWidgetState();
}

class _ResearchFieldWidgetState extends State<ResearchFieldWidget> {
  final TextEditingController _researchFieldController =
      TextEditingController();
  final FocusNode _researchFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _researchFieldController.dispose();
    _researchFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 48.0,
          right: 10.0,
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: TextFormField(
              controller: _researchFieldController,
              focusNode: _researchFieldFocusNode,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Digite o contato',
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(Icons.search_sharp),
                prefixIconColor: Colors.grey,
                suffixIcon: GestureDetector(
                  onTap: () {
                    _researchFieldController.text = '';
                    _researchFieldFocusNode.unfocus();

                    widget.search('');
                  },
                  child: Icon(
                    Icons.clear_rounded,
                    color: Colors.grey.shade800,
                  ),
                ),
                border: InputBorder.none,
              ),
              onEditingComplete: () {
                _researchFieldFocusNode.unfocus();
                final String value = _researchFieldController.text.trim();

                widget.search(value);
              },
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
        ),
      ),
    );
  }
}
