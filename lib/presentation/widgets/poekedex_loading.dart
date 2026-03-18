import 'package:flutter/material.dart';

class PokedexLoading extends StatefulWidget {
  const PokedexLoading({super.key});

  @override
  State<PokedexLoading> createState() => _PokedexLoadingState();
}

class _PokedexLoadingState extends State<PokedexLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/Loading.gif',
        width: double.infinity,
        height: 100,
      ),
    );
  }
}
