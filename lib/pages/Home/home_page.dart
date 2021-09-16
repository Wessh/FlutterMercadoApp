import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _produto = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  final TextEditingController _valor = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de produto'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _produto,
              decoration: const InputDecoration(
                  labelText: 'Produto', hintText: 'Adicione o nome do produto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _quantidade,
              decoration: const InputDecoration(
                  labelText: 'Quantidade', hintText: '000'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _valor,
              decoration: const InputDecoration(
                  labelText: 'Preço', hintText: '0,00', prefixText: 'R\$ '),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  final String nome = _produto.text;
                  final int? quantidade = int.tryParse(_quantidade.text);
                  final double? valor = double.tryParse(_valor.text);
                  if (_produto.text.isNotEmpty &&
                      _quantidade.text.isNotEmpty &&
                      _valor.text.isNotEmpty) {
                    final Produto produtoAdd =
                        Produto(nome, quantidade!, valor!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$produtoAdd'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preencha os campos corretamente!'),
                      ),
                    );
                  }
                },
                child: const Text('Cadastrar')),
          )
        ],
      ),
    );
  }
}

class Produto {
  late String nome;
  late int quantidade;
  late double valor;

  Produto(this.nome, this.quantidade, this.valor);

  @override
  String toString() =>
      'Produto(nome: $nome, quantidade: $quantidade, valor: $valor)';
}
