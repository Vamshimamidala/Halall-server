import 'package:flutter/material.dart';

class AddIngredientsPage extends StatefulWidget {
  @override
  _AddIngredientsPageState createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends State<AddIngredientsPage> {
  final List<Map<String, String>> ingredientsList = [{"category": "", "name": ""}]; // Default one card

  void _addIngredient() {
    setState(() {
      ingredientsList.add({"category": "", "name": ""});
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      ingredientsList.removeAt(index);
    });
  }

  Widget _buildIngredientCard(int index) {
    final ingredient = ingredientsList[index];

    return Card(
      color: const Color(0xFFE3F5E4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Cross button for additional cards
            if (index > 0)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF252525)), // Cross button color
                  onPressed: () => _removeIngredient(index),
                ),
              ),
            _buildLabel("Select Category"),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              hint: const Text('Select Category'), // Hint text for the dropdown
              value: ingredient['category']!.isEmpty ? null : ingredient['category'],
              onChanged: (value) {
                setState(() {
                  ingredient['category'] = value ?? "";
                });
              },
              items: [
                const DropdownMenuItem(value: '', child: Text('Select Category', style: TextStyle(color: Colors.grey))),
                const DropdownMenuItem(value: 'Vegetable', child: Text('Vegetable')),
                const DropdownMenuItem(value: 'Fruit', child: Text('Fruit')),
                const DropdownMenuItem(value: 'Dairy', child: Text('Dairy')),
              ],
              decoration: _inputDecoration(),
            ),
            const SizedBox(height: 12),
            _buildLabel("Ingredient Name"),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  ingredient['name'] = value;
                });
              },
              decoration: _inputDecoration(hintText: "Enter Ingredient Name"),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.2),
          width: 0.5,
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
        ),
        const Text(
          '*',
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Ingredients'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height:45, // Decreased height
                child: ElevatedButton(
                  onPressed: _addIngredient,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF47A851), // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text('Add More', style: TextStyle(fontSize: 12)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: ingredientsList.length,
                itemBuilder: (context, index) {
                  return _buildIngredientCard(index);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle submit action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF47A851), // Same color as Add More button
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}