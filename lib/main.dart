import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  home: BossFonts(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData.dark(),
));

class BossFonts extends StatefulWidget {
  @override
  _BossFontsState createState() => _BossFontsState();
}

class _BossFontsState extends State<BossFonts> {
  String input = "";
  final TextEditingController controller = TextEditingController();

  List<String> generateVIPStyles(String t) {
    if (t.isEmpty) return ["Apna Naam Likhein Boss! 👑"];
    String spaced = t.split('').join(' ');
    return [
      "👑 𝕭𝖔𝖘𝖘 $t 👑",
      "🎸 𝕸𝖚𝖘𝖎𝖈 𝕶𝖎𝖓𝖌: $t 🎶",
      "⚔️ ꧁༺ $t ༻꧂ ⚔️",
      "🔥 🅑🅞🅢🅢 $t 🔥",
      "⚡️ $spaced ⚡️",
      "💎 𝓥𝓘𝓟 $t 💎",
      "🔱 $t 𝕸𝖆𝖍𝖆𝖐𝖆𝖑 🔱",
      "🦁 𝑹𝒐𝒚𝒂𝒍 $t 🦁",
      "💀 𝕯𝖊𝖆𝖉𝖑𝖞-$t 💀",
      "🎯 ╰‿╯ $t ╰‿╯",
      "🐍 𝕍𝕚𝕡𝕖𝕣 $t 🐍",
      "🌟 ★彡 $t 彡★ 🌟",
      "🖤 𝔅𝔩𝔞𝔠𝔨 $t 🖤",
      "🎧 [DJ-$t-REMIX] 🎧",
      "😈 𝕯𝖊𝖛𝖎𝖑 $t 😈",
      "🧊 𝔉𝔯𝔬𝔷𝔢𝔫 $t 🧊",
      "👑 𝕶𝖎𝖓𝖌 𝕺𝖋 𝕳𝖊𝖆𝖗𝖙𝖘: $t 👑",
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<String> styles = generateVIPStyles(input);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("ALL INDIA VIP FONT BOSS"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.cyanAccent, fontSize: 18),
              decoration: InputDecoration(
                hintText: "Naam likhein...",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyanAccent)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
              onChanged: (val) => setState(() => input = val),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: styles.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xFF1A1A1A),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    title: Text(styles[index], style: TextStyle(color: Colors.white, fontSize: 18)),
                    trailing: Icon(Icons.copy, color: Colors.cyanAccent),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: styles[index]));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Style Copy Ho Gaya Boss!")));
                    },
                  ),
                );
              },
            )
