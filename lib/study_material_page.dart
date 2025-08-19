import 'package:flutter/material.dart';
import 'material_detail_page.dart';

class StudyMaterialPage extends StatelessWidget {
  const StudyMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF002855) : Colors.white;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF002855);
    final listTileColor = isDarkMode ? Colors.white.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1);
    final dividerColor = isDarkMode ? Colors.white24 : Colors.grey.withValues(alpha: 0.3);

    final List<Map<String, String>> materials = [
      {"subject": "Maths", "file": "maths.pdf"},
      {"subject": "Physics", "file": "physics.pdf"},
      {"subject": "Electronics", "file": "ece.pdf"},
      {"subject": "Programming", "file": "programming.pdf"},
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Study Materials",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : const Color(0xFF002855),
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : const Color(0xFF002855),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: materials.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: listTileColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: dividerColor,
                width: 1,
              ),
            ),
            child: ListTile(
              splashColor: Colors.transparent,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              title: Text(
                materials[index]["subject"]!,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                materials[index]["file"]!,
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: textColor.withValues(alpha: 0.6),
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaterialDetailPage(
                      subject: materials[index]["subject"]!,
                      file: materials[index]["file"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


