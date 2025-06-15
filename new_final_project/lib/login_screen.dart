import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Presiona el botón y empieza a hablar';
  String _status = 'Inicializando...';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initSpeech();
  }

  void _initSpeech() async {
    setState(() {
      _status = 'Preparando reconocimiento...';
    });

    await Future.delayed(const Duration(milliseconds: 800));

    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );

    setState(() {
      _status = available
          ? '🎤 Listo, puedes hablar'
          : '❌ Reconocimiento de voz no disponible';
    });
  }

  void _startListening() async {
    if (!_isListening) {
      if (_speech.isAvailable) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = val.recognizedWords;
            });

            if (_text.toLowerCase().contains("comprar")) {
              _speech.stop();
              setState(() => _isListening = false);
              Navigator.pushNamed(context, '/home');
            }
          },
        );
      } else {
        setState(() => _status = '❌ Micrófono no disponible');
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 120,
                ),
                const SizedBox(height: 40),
                const Text(
                  '¡Hola de nuevo, Sarah!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                const Text(
                  '¿Eres tú?',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _startListening,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD62828),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isListening ? Icons.mic_off : Icons.mic,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Acceso a tu app',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    // Lógica para cambiar de usuario
                  },
                  child: const Text(
                    'No, soy alguien más',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFD62828),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  _status,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                // 🔴 Aquí se muestra lo que el usuario dice en vivo
                Text(
                  _text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
