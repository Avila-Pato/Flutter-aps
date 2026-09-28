

import 'package:flutter/material.dart';
import 'package:maybe/domain/entities/message.dart';


class HerMessageBubble extends StatelessWidget {

  final Message message;
  const HerMessageBubble({super.key,   required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 30,),
        
        // Si existe una imagen agrega un espacio de 10 pixeles
       if(message.imageUrl != null) ...[
         const SizedBox(height: 10,),
         _ImageBubble(message.imageUrl!),
       ],

        const SizedBox(height: 10,)
      ],
    );

  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: 150,
        height: 150,
        fit: BoxFit.cover,

        // Loader de carga
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: 150,
            height: 150,
            child: const CircularProgressIndicator(strokeWidth: 2,),
          );
        },
      ),
    );
  }
}