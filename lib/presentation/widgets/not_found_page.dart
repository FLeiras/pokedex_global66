import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final String title;
  final String message;
  final String? secondaryMessage;
  final String imagePath;
  final bool showRetryButton;
  final Function()? onRetry;

  const NotFoundPage({
    super.key,
    required this.title,
    required this.message,
    this.secondaryMessage,
    required this.imagePath,
    this.onRetry,
    required this.showRetryButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 220,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            if (secondaryMessage != null)
              Text(
                secondaryMessage!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            if (showRetryButton)
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.blueAccent),
                child: const Text(
                  'Reintentar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
