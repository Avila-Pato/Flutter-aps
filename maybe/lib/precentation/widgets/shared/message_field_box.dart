import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  // Propeidad
  final ValueChanged<String> onValue;
  // Constructor
  MessageFieldBox({super.key, required this.onValue});
  // Controlador
  final textController = TextEditingController();
  final focusNode = FocusNode();

  // Estilos de la caja ade
  final outlineInputBorder = UnderlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(40),
  );

  late final inputDecoration = InputDecoration(
    focusedBorder: outlineInputBorder,
    filled: true,
    fillColor: Colors.white,
    suffixIcon: IconButton(
      icon: const Icon(Icons.send_outlined, color: Colors.blue),
      onPressed: () {
        final textValue = textController.value.text;
        textController.clear();
        onValue(textValue);
        
      },
    ),
    hintText: 'Escribe tu mensaje aquí ...',
    hintStyle: const TextStyle(color: Colors.blue, fontSize: 18),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.blue, fontSize: 18),

      // Controlador
      onTapOutside: (event) => {
        focusNode.unfocus(),
      }, // Desactivar el teclado

      // Controlador para el teclado y obtener el contenido del campo
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,

      // Evento para cuanso el usuario presiona enter
      //borrando lo que escribio
      // y activando el teclado con el focus
      onFieldSubmitted: (value) => {
        textController.clear(),
        focusNode.requestFocus(),
        onValue(value),
      },
    );
  }
}
