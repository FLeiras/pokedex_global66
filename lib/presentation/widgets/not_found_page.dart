import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
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
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  bool isRetrying = false;

  void handleRetry() async {
    setState(() => isRetrying = true);

    widget.onRetry?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 220,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.secondaryMessage != null)
              Text(
                widget.secondaryMessage!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            if (widget.showRetryButton)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: isRetrying ? null : handleRetry,
                child: isRetrying
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(
                        'Reintentar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
