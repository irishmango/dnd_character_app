import 'package:dnd_character_app/models/character.dart';
import 'package:dnd_character_app/theme.dart';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.chartacter});

  final Character chartacter;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // tween sequence
  late Animation _sizeAnimation;


  @override
  void initState() {
    
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this
    );
    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 25, end: 40),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 40, end: 25),
        weight: 50,
      ),
    ]).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
            widget.chartacter.toggleIsFav();
          }, 
          icon: Icon(Icons.favorite,
          color: widget.chartacter.isFav
          ? AppColors.primaryColor
          : Colors.grey[800],
          size: _sizeAnimation.value,
          )
          );
      },
    );
  }
}