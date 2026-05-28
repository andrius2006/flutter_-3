import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      locale: Locale("es", "ES"),
      supportedLocales: [Locale("es", "ES"),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  // Formulario
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Variable del sistema
  String rol = "Usuario";
  DateTime? fechaNacimiento;
  bool aceptaTerminos = false;
  bool notificaciones = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
        backgroundColor: const Color.fromARGB(255, 11, 117, 215),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            children: [
              const Icon(
                Icons.account_circle,
                size: 120,
                color: Color.fromARGB(255, 6, 203, 187),
              ),

              const SizedBox(height: 20),

              const Text(
                "Ingrese sus datos",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Nombre
              TextFormField(
                controller: nameController,

                decoration: const InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese tu nombre";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Correo
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Correo electrónico",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese tu correo electrónico";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Por favor, ingrese un correo electrónico válido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Teléfono
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  // Filtrar solo números
                  FilteringTextInputFormatter.digitsOnly,
                ],

                decoration: const InputDecoration(
                  labelText: "Número de teléfono",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese tu número de teléfono";
                  }
                  if (value.length < 7) {
                    return "El número de teléfono debe tener al menos 7 dígitos";
                  }
                  return null;
                },
                

              ),

              const SizedBox(height: 20),

              // Contraseña
              TextFormField(
                controller: passwordController,
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingrese una contraseña";
                  }
                  if (value.length < 6) {
                    return "La contraseña debe tener al menos 6 caracteres";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Rol
              DropdownButtonFormField<String>(
                value: rol,

                decoration: const InputDecoration(
                  labelText: "Rol",
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(
                    value: "Usuario",
                    child: Text("Usuario"),
                  ),

                  DropdownMenuItem(
                    value: "Administrador",
                    child: Text("Administrador"),
                  ),

                  DropdownMenuItem(
                    value: "cliente",
                    child: Text("cliente"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    rol = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              // Botón fecha
              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.calendar_month),

                  label: Text(
                    fechaNacimiento == null
                        ? "Seleccionar fecha de nacimiento"
                        : "Fecha de nacimiento: ${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}",
                  ),

                  onPressed: () async {
                    DateTime? fechaSeleccionada = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2027),
                    );

                    if (fechaSeleccionada != null) {
                      setState(() {
                        fechaNacimiento = fechaSeleccionada;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text("Acepto los términos y condiciones"),
                value: aceptaTerminos,
                onChanged: (value) {
                  setState(() {
                    aceptaTerminos = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              //switch para recibir notificaciones
              SwitchListTile(
                title: const Text("Recibir notificaciones"),
                value: notificaciones,
                onChanged: (value) {
                  setState(() {
                    notificaciones = value;
                  });
                },
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Validar el formulario 
                    if (formKey.currentState!.validate()&& aceptaTerminos) {
                      print("formulario válido, procesar datos...");
                      print("Nombre: ${nameController.text}");
                      print("Correo: ${emailController.text}");
                      print("Teléfono: ${phoneController.text}");
                      print("Contraseña: ${passwordController.text}");
                    }

                    else {
                      print("por favor, complete el formulario y acepte los términos.");
                    }
                  },
                  child: const Text("Registar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}