import 'package:flutter/material.dart';
import 'package:my_app/db/db_helper.dart';
import 'package:my_app/db_helper/db_helper.dart';

class CrudSQLScreen extends StatefulWidget {
  const CrudSQLScreen({Key? key}) : super(key: key);

  @override
  _CrudSQLScreenState createState() => _CrudSQLScreenState();
}

class _CrudSQLScreenState extends State<CrudSQLScreen> {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  // Read Data
  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  // Create Data
  Future<void> _addData() async {
    await SQLHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }

  // Upadate Data
  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
    _refreshData();
  }

  // Delete Data
  Future<void> _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 255, 14, 239), content: Text('Data Dihapus')));
    _refreshData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void showBottomSheet(int? id) async {
  if (id != null) {
    final existingData = _allData.firstWhere((element) => element['id'] == id);
    if (existingData != null) {
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
    } else {
      // Handle the case where no element is found (e.g., show a message)
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data with that ID not found')));
    }
  }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  }
                  if (id != null) {
                    await _updateData(id);
                  }

                  _titleController.text = "";
                  _descController.text = "";

                  Navigator.of(context).pop();
                  print("Data Added");
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Data" : "Update",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD SQLITE'),
        backgroundColor: Color.fromARGB(255, 255, 10, 222),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      _allData[index]['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Text(_allData[index]['desc']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showBottomSheet(_allData[index]['id']);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 255, 23, 236),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteData(_allData[index]['id']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 251, 26, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: Icon(Icons.add),
      ),
    );
  }
}