import 'package:flutter/material.dart';

class MaterialDetailPage extends StatelessWidget {
  final String subject;
  final String file;

  const MaterialDetailPage({
    super.key,
    required this.subject,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF002855) : Colors.white;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF002855);
    final cardColor = isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1);
    final borderColor = isDarkMode ? Colors.white24 : Colors.grey.withValues(alpha: 0.3);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          subject,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : const Color(0xFF002855),
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : const Color(0xFF002855),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: borderColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.description,
                      size: 64,
                      color: textColor.withValues(alpha: 0.7),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      subject,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                                          Text(
                        file,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 24),
                    Text(
                      "This is a placeholder for $file",
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


