import 'package:flutter/material.dart';

class ManageProductPage extends StatefulWidget {
  const ManageProductPage({super.key});

  @override
  State<ManageProductPage> createState() => _ManageProductPageState();
}

class _ManageProductPageState extends State<ManageProductPage> {
  final ScrollController _horizontalScrollController = ScrollController();
  double _horizontalScrollPosition = 0.0;
  String? selectedCat = 'Menu1';
  final List<String> cat = ['Menu1', 'Menu2'];
  // Function to handle manual horizontal scrolling through the custom scrollbar
  void _onHorizontalDragScroll(double newPosition) {
    setState(() {
      _horizontalScrollPosition = newPosition;
      _horizontalScrollController.jumpTo(
          _horizontalScrollController.position.maxScrollExtent * newPosition);
    });
  }
  Widget _buildCatDropdown() {
    return Container(
      height: 40,
      width: 110,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border:
        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2), width: 0.5),
      ),
      child: DropdownButton<String>(
        value: selectedCat,
        hint: const Text('Select menu'),
        isExpanded: true,
        items: cat.map((String cato) {
          return DropdownMenuItem<String>(
            value: cato,
            child: Text(cato),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCat = newValue;
          });
        },
        underline: const SizedBox(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        const Size.fromHeight(60.0), // Set your custom height here
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashbord');
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
          title: const Text(
            'Manage Products',
            style: TextStyle(fontSize: 20),
          ),

          backgroundColor: Colors.white, // Set app bar color to green
        ),
      ),

      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    height: sHeight * 0.05,
                    padding: const EdgeInsets.only(
                        right: 5, left: 5, bottom: 7), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                      border: Border.all(
                        color: Colors.black.withOpacity(0.20), // rgba(0, 0, 0, 0.20)
                        width: 0.5, // 0.5px solid
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0), // Padding for the icon
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search By Product Name....',
                              hintStyle: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                              ),
                              border: InputBorder.none, // Remove the default border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(padding:EdgeInsets.only(left:10),child: Align(alignment: Alignment.centerLeft, child:_buildCatDropdown(),)),

                  Container(
                    margin: const EdgeInsets.only(bottom: 10, right: 10),
                    height: sHeight * 0.05, // Height of the button
                    width: 150, // Fixed width of the button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addproduct');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5), // Horizontal padding
                        backgroundColor: const Color(0xFF47A851), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        elevation: 0, // No shadow
                      ),
                      child: const Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center, // Center text horizontally
                        children: [
                          Text(
                            'Create New Product',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontFamily: 'Roboto', // Font family
                              fontSize: 14, // Font size
                              fontWeight: FontWeight.w600, // Font weight
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Container for the table which occupies 70% of the screen height
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: const Color(0xFFE3F5E4), // Ensure consistent green color
                      elevation: 2, // Subtle elevation for better appearance
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Smooth rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: sHeight * 0.65, // Retain the original height
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F5E4), // Explicit background color
                            borderRadius: BorderRadius.circular(8), // Rounded corners

                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _horizontalScrollController,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 800,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    headingRowColor: MaterialStateProperty.all(Colors.white),
                                    columns: const <DataColumn>[
                                      DataColumn(label: Text('Name')),
                                      DataColumn(label: Text('Price')),
                                      DataColumn(label: Text('Menu')),
                                      DataColumn(label: Text('Halal Status')),
                                      DataColumn(label: Text('Qr Code')),
                                      DataColumn(label: Text('Status')),
                                      DataColumn(label: Text('Rating')),
                                      DataColumn(label: Text('Actions')),
                                    ],
                                    rows: List<DataRow>.generate(20, (index) {
                                      return DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text('Product $index')),
                                          DataCell(Text('\$${(index + 1) * 10.00}')),
                                          DataCell(Text('Menu $index')),
                                          DataCell(Text(index % 2 == 0 ? 'Yes' : 'No')),
                                          DataCell(const Icon(Icons.qr_code)),
                                          DataCell(
                                            Text(index % 2 == 0 ? 'Active' : 'Inactive'),
                                          ),
                                          DataCell(Text((4.0 + (index % 1)).toString())),
                                          DataCell(Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  // Edit action
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {
                                                  // Delete action
                                                },
                                              ),
                                            ],
                                          )),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}