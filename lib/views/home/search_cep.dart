import 'package:flutter/material.dart';
import 'package:repassa/assets/app_colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCep extends StatefulWidget {
  SearchCep({Key? key}) : super(key: key);

  @override
  State<SearchCep> createState() => _SearchCepState();
}

class _SearchCepState extends State<SearchCep> {
  String resultado = '';
  TextEditingController txtcep = TextEditingController();

  void buscacep() async {
    final prefs = await SharedPreferences.getInstance();

    String cep = txtcep.text;
    String url = ("https://viacep.com.br/ws/$cep/json/");
    http.Response response;
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> dados = json.decode(response.body);

    String localidade = dados['localidade'];
    String cepLocal = dados['cep'];

    await prefs.setString(
        'localEnrega', "Eviar para $localidade - CEP: $cepLocal");
    String localEnrega = "Eviar para $localidade - CEP: $cepLocal";

    setState(() {
      resultado = localEnrega;
    });
  }

  @override
  void initState() {
    super.initState();
    lecep();
  }

  lecep() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      resultado = (prefs.getString('localEnrega') ?? 'sem endereço de entrega');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.room,
                color: AppColors.primaryColor,
              ),
              Text(
                resultado,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: false,
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Qual sua localização?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    'fechar',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              controller: txtcep,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'CEP',
                              ),
                            ),
                            const TextButton(
                              onPressed: null,
                              child: Text(
                                'Localização Atual',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => {
                                buscacep(),
                                Navigator.pop(context),
                              },
                              child: const Text(
                                'Continuar',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('alterar'),
          ),
        ],
      ),
    );
  }
}
