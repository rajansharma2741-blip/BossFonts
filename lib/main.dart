import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BossFonts(),
    );
  }
}

class BossFonts extends StatefulWidget {
  const BossFonts({super.key});

  @override
  State<BossFonts> createState() => _BossFontsState();
}

class _BossFontsState extends State<BossFonts> {
  String input = "";
  final TextEditingController controller = TextEditingController();

  List<String> generateAllStyles(String t) {
    if (t.trim().isEmpty) return ["Naam likhein Boss!"];

    String spaced = t.split('').join(' ');
    String dashed = t.split('').join('-');
    String dotted = t.split('').join('.');

    return [
      "🎸 𝕸𝖚𝖘𝖎𝖈 𝕶𝖎𝖓𝖌: $t 🎶",
      "🎧 [DJ-$t-REMIX] 🎧",
      "✨ $spaced ✨",
      "⚡ $dashed ⚡",
      "💎 $dotted 💎",
      "⚔️ ꧁༺ $t ༻꧂ ⚔️",
      "👑 𝕭𝖔𝖘𝖘 $t 👑",
      "🐍 𝕍𝕚𝕡𝕖𝕣 $t 🐍",
      "🎶 𝔖𝔬𝔫𝔤 𝔏𝔬𝔳𝔢𝔯 $t 🎵",
      "🎹 $t-𝕭𝖊𝖆𝖙𝖘 🎹",
      "🔥 🅑🅞🅢🅢 $t 🔥",
      "🦁 𝕽𝖔𝖞𝖆𝖑 $t 🦁",
      "💀 $dashed-𝕯𝖊𝖆𝖉𝖑𝖞 💀",
      "🎯 ╰‿╯ $spaced ╰‿╯",
      "🔱 $t-𝕸𝖆𝖍𝖆𝖐𝖆𝖑 🔱"
    ];
  }

  @override
  Widget build(BuildContext context) {
    final allStyles = generateAllStyles(input);

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("VIP MUSIC & FONT BOSS"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),

      body: Column(
        children: [

          // 🔤 Input Box
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),

              decoration: const InputDecoration(
                hintText: "Yahan naam likhein...",
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Magic Name Box",
                labelStyle: TextStyle(color: Colors.cyanAccent),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyanAccent),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),

              onChanged: (val) {
                setState(() {
                  input = val;
                });
              },
            ),
          ),

          // 📜 List
          Expanded(
            child: ListView.builder(
              itemCount: allStyles.length,

              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[900],

                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.deepPurple,
                      width: 0.5,
                    ),
                  ),

                  child: ListTile(
                    title: Text(
                      allStyles[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    trailing: const Icon(
                      Icons.copy,
                      color: Colors.cyanAccent,
                    ),

                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: allStyles[index]),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.cyanAccent,
                          content: Text(
                            "Style Copy Ho Gaya!",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
