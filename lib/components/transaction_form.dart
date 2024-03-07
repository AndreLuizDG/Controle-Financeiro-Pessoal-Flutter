import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('Nova transação'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  onPressed: () {
                   final title = titleController.text;
                   final Value = double.tryParse(valueController.text) ?? 0.0;

                   if (title.isEmpty || Value <= 0){
                    return;
                   }
                   widget.onSubmit(title, Value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
