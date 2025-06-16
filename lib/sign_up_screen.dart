import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>(); // ✅ Llave del formulario

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final providerKeyController = TextEditingController();
  final clientKeyController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          // ✅ Aquí empieza el formulario
          key: _formKey,
          child: Column(
            children: [
              _buildLabeledInput('Nombre', nameController),
              const SizedBox(height: 24),
              _buildLabeledInput('Número de Teléfono', phoneController),
              const SizedBox(height: 24),
              _buildLabeledInput('Clave de proveedor', providerKeyController),
              const SizedBox(height: 24),
              _buildLabeledInput('Clave de cliente', clientKeyController),
              const SizedBox(height: 24),
              _buildLabeledInput('Contraseña', passwordController,
                  isPassword: true),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // ✅ Solo se ejecuta si todo es válido
                    print("Nombre: ${nameController.text}");
                    print("Teléfono: ${phoneController.text}");
                    print("Proveedor: ${providerKeyController.text}");
                    print("Cliente: ${clientKeyController.text}");
                    print("Contraseña: ${passwordController.text}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('✅ Datos registrados')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD62828),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Finalizar registro',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledInput(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Este campo es obligatorio';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: '',
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            left: 12,
            top: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              color: Colors.white,
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Lato',
                      color: Color(0xFF413537)),
                  children: [
                    TextSpan(text: '$label '),
                    const TextSpan(
                      text: '*',
                      style: TextStyle(color: Color(0xFFF50109)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
