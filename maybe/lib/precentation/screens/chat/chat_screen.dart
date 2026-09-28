
import 'package:flutter/material.dart';
import 'package:maybe/precentation/widgets/chat/my_message_bubble.dart';
 
 class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: CircleAvatar(
            radius: 25,
            backgroundImage: const AssetImage('./lib/assets/images.jpg'),
          ),
        ),
        title: const Text('María Teresa'),
        centerTitle: false,
        ),
        body: _ChatView()
    );
  }

}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(), //
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return const MyMessageBubble();
                  }), 
              )
              // _Messages(),
              // _InputChat(),
            ],
          ),
      ),
    );
  }
}

// Scaffold => esqueleto de una pantalla ya da lugares lsitos para la barra superir
// SafeArea => Evita que el cotenido quede tapado por el notch la barra de estado o los botones del sistema

//Expanded => le dice a un hijo de Column que ocupe todo ele spacio que sobre
//la lista asi se estiray el input queda fijo
//
//ListView.Builder = lista con scroll que crea cada elemento solo cuando se necesita(Perezozamanet)  
// po lo que es eficiente aunqeu tengas cientos de mensajes.

//BouncinsScroollPhysics => hace que el scroll sea mas suave efecto reborete

// StatelessWidget => es un widget que no cambia; solo dibuja segun los datos que recibe. 
//
//cuando el chat  nececite estado pasara a un statefullwidget que el dice a flutter que ese widget
//nunca cambia asi que loc rea uan sola vez y lor eutilzia mejora el rendimiento 