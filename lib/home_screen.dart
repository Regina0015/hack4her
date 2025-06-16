import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  Encabezado estilo Figma
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🖼️ Logo Tuali
                    Container(
                      width: 88,
                      height: 31,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 📍 Mi Tiendita
                    const Expanded(
                      child: Text(
                        'Mi Tiendita',
                        style: TextStyle(
                          color: Color(0xFF413537),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                    ),
                    // 📱 Menú
                    const SizedBox(
                      width: 41,
                      height: 27,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Menú',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFC31F39),
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 1.43,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔍 Buscador funcional (con campo de texto)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFF413537)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            // Aquí podrías filtrar productos si tienes una lista
                            print('Buscando: $value');
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Buscar productos...',
                            hintStyle: TextStyle(
                              color: Color(0xFF413537),
                              fontSize: 14,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 🧱 Contenido principal
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 🔴 Botón Coca-Cola
                    Container(
                      width: 165,
                      height: 123,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.5, 0),
                          end: Alignment(0.5, 1),
                          colors: [Color(0xFFD62828), Color(0xFF8B1919)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          child: Image.asset(
                            'assets/coca.png',
                            fit: BoxFit.cover,
                            height: 60,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🟡 Botón Bokados
                    Container(
                      width: 165,
                      height: 123,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.5, 0),
                          end: Alignment(0.5, 1),
                          colors: [Color(0xFFFFBF11), Color(0xFF99720A)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/bokados.png',
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 🔠 Título Categorías

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CATEGORÍAS y PRODUCTOS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                      letterSpacing: 0.10,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 🧱 Grid de Categorías
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildCategoryBox('assets/descuento.png'),
                  _buildCategoryBox('assets/refrescos.png'),
                  _buildCategoryBox('assets/aguas.png'),
                  _buildCategoryBox('assets/powerade.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 📦 Función para construir cada botón de categoría
  Widget _buildCategoryBox(String imagePath) {
    return Container(
      width: 165,
      height: 123,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFC4C0C1),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x4C000000),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
