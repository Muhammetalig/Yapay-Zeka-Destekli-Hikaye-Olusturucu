import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

const String apiKey = 'AIzaSyAp4B98v1x7PLCVEp6vO-snzHRdH_YHZr0';
const String apiUrl =
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

Future<String> generateStory(String prompt) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl?key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "Aralarına virgül koyarak yazdığım kelimeleri kullanarak okuyucuların sıkılmayacağı eğlenceli hüzünlü ya da daha farklı duygular barındıran hikayeler yaz ve direkt hikayeye gir tamadır yazıyorum falan deme bir de tek bir hikaye yaz: $prompt"
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'].trim();
    } else {
      return '⚠️ API isteği başarısız oldu: ${response.statusCode} - ${response.body}';
    }
  } catch (e) {
    return '🚨 Hata oluştu: $e';
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Hikaye Üretici',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StoryGeneratorPage(),
    );
  }
}

class StoryGeneratorPage extends StatefulWidget {
  @override
  _StoryGeneratorPageState createState() => _StoryGeneratorPageState();
}

class _StoryGeneratorPageState extends State<StoryGeneratorPage> {
  final TextEditingController _controller = TextEditingController();
  String _story = '';
  bool _isLoading = false;
  FlutterTts flutterTts = FlutterTts();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('tr-TR');
    flutterTts.setPitch(1.0);
    flutterTts.setCompletionHandler(() {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  void _generateStory() async {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) {
      setState(() {
        _story = '⚠️ Lütfen bir metin giriniz.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _story = '';
    });

    try {
      final story = await generateStory(prompt);
      setState(() {
        _story = story;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _story = '🚨 Hikaye oluşturulurken hata oluştu.';
        _isLoading = false;
      });
    }
  }

  void _toggleSpeech() async {
    if (_isPlaying) {
      await flutterTts.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await flutterTts.speak(_story);
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gemini Hikaye Üretici'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Başlangıç cümlenizi girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _generateStory,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Hikaye Oluştur'),
            ),
            SizedBox(height: 20),
            _story.isNotEmpty
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _story,
                          style: TextStyle(fontSize: 16, height: 1.6),
                        ),
                      ),
                    ),
                  )
                : Container(),
            _story.isNotEmpty
                ? ElevatedButton(
                    onPressed: _toggleSpeech,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isPlaying ? Colors.red : Colors.green,
                    ),
                    child: Text(_isPlaying ? 'Durdur' : 'Oku'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
