import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:looksy/presentation/utils/theme.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Help Center',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1b1b1b),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(IconsaxOutline.arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type 2 or more characters',
                hintStyle: TextStyle(color: neutralTheme[300]!),
                prefixIcon: Icon(IconsaxOutline.search_normal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: neutralTheme[100]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: neutralTheme[100]!, width: 1),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // Daftar Opsi
          Expanded(
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      HelpCenterOption(
                        title: 'How To Get Hairstyle Recommendations',
                        onTap: () {},
                        hasDivider: true,
                      ),
                      HelpCenterOption(
                        title: 'How To Book Barbershop Services',
                        onTap: () {},
                        hasDivider: true,
                      ),
                      HelpCenterOption(
                        title: 'How To See Hair Care Tips',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpCenterPage()),
                          );
                        },
                        hasDivider: true,
                      ),
                      HelpCenterOption(
                        title: 'How To Change A Password',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpCenterPage()),
                          );
                        },
                        hasDivider: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HelpCenterOption extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final GestureTapCallback onTap;
  final bool hasDivider;

  const HelpCenterOption({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.hasDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 12),
        decoration: BoxDecoration(
          border: hasDivider
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFE7E7E7)),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? neutralTheme,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
