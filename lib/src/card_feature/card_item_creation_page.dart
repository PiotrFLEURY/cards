import 'package:cards/src/card_feature/card_item.dart';
import 'package:cards/src/card_feature/card_item_view.dart';
import 'package:cards/src/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:cards/src/extensions/color_extension.dart';

class CardItemCreationPage extends StatefulWidget {
  static const String routeName = "/creation";

  const CardItemCreationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CardItemCreationPage> createState() => _CardItemCreationPageState();
}

class _CardItemCreationPageState extends State<CardItemCreationPage> {
  late TextEditingController idController;
  late TextEditingController labelController;
  late String _id;
  late String _label;
  late String _color;
  bool initialized = false;

  void init(BuildContext context) {
    if (initialized) return;

    CardItem? cardItem =
        ModalRoute.of(context)?.settings.arguments as CardItem?;

    _id = cardItem?.id ?? '123456789';
    _label = cardItem?.label ?? 'Card Item';
    _color = cardItem?.color ?? 'C2C2C2';

    idController = TextEditingController(text: _id);
    labelController = TextEditingController(text: _label);

    initialized = true;
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 16),
              CardItemView(
                card: CardItem(
                  id: _id,
                  label: _label,
                  color: _color,
                ),
              ),
              const SizedBox(height: 16),
              // 3 fields, id, label, and color
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Card ID',
                  border: OutlineInputBorder(),
                  hintText: 'Enter a unique ID for this card',
                  suffixIcon: Icon(Icons.camera_alt_outlined),
                ),
                onChanged: (value) => setState(() => _id = value),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: labelController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Card Label',
                  border: OutlineInputBorder(),
                  hintText: 'Enter a label for this card',
                ),
                onChanged: (value) => setState(() => _label = value),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _showColorPicker(context),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  color: _color.toColor(),
                  child: Center(
                    child: Text(
                      '#$_color',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              CustomButton(
                onPressed: () => _submit(context),
                text: 'submit',
                icon: Icons.check,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    CardItem newCard = CardItem(
      id: _id,
      label: _label,
      color: _color,
    );
    Navigator.of(context).pop(newCard);
  }

  Future<void> _showColorPicker(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: BlockPicker(
          pickerColor: _color.toColor(),
          onColorChanged: (Color color) {
            setState(() => _color = color.toHexString());
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
