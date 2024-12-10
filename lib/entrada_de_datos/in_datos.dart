import 'package:flutter/material.dart';
//import 'package:mi_primera_app/entrada_de_datos/widgets/my_checkbox_widget.dart';

class InDatos extends StatefulWidget {
  const InDatos({super.key});

  @override
  State<InDatos> createState() => _InDatosState();
}

class _InDatosState extends State<InDatos> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  // int _isRadioGroup = 1;
  // bool _isSwitched = false;

  // void _handleRadioValueChange(int? value) {
  //   setState(() {
  //     _isRadioGroup = value!;
  //   });
  // }

  // void _handleSwitch(bool newValue) {
  //   setState(() {
  //     _isSwitched = newValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Entrada de datos"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Nombre"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese un nombre";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    title: const Text("Acepto los terminos y condiciones"),
                  ),
                  const SizedBox(height: 40),

                  // const TextField(
                  //   decoration: InputDecoration(
                  //       labelText: "Nombre", border: OutlineInputBorder()),
                  // ),
                  // MyCheckboxWidget(onChanged: (bool? newValue) {
                  //   setState(() {
                  //     _isChecked = newValue!;
                  //   });
                  // })

                  // Radio<int>(
                  //     value: 1,
                  //     groupValue: _isRadioGroup,
                  //     onChanged: _handleRadioValueChange),
                  // Radio<int>(
                  //     value: 2,
                  //     groupValue: _isRadioGroup,
                  //     onChanged: _handleRadioValueChange),
                  // Switch(value: _isSwitched, onChanged: _handleSwitch)

                  ElevatedButton(
                      onPressed: _isChecked
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                              }
                            }
                          : null,
                      child: const Text("Enviar"))
                ],
              ),
            )));
  }
}
