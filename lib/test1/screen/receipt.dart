import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:np_app_test/model/reciept.dart';
import 'package:np_app_test/test1/widget/colors.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _itemsController = TextEditingController();
  List<Receipt> receiptList = [];
  CollectionReference receipts =
      FirebaseFirestore.instance.collection('receipts');

  Future<void> addReceipt(Receipt receipt) {
    return receipts
        .add({
          'address': receipt.address,
          'tel': receipt.tel,
          'time': receipt.time,
          'items': receipt.item
        })
        .then((value) => print("Receipt Added"))
        .catchError((error) => print("Failed to add receipt: $error"));
  }

  Future<void> updateReceipt(Receipt receipt) {
    return receipts
        .doc(receipt.id)
        .update({
          'address': receipt.address,
          'tel': receipt.tel,
          'time': receipt.time,
          'items': receipt.item
        })
        .then((value) => print("Receipt Updated"))
        .catchError((error) => print("Failed to update receipt: $error"));
  }

  Future<List<Receipt>> getReceipts() async {
    QuerySnapshot querySnapshot =
        await receipts.orderBy('time', descending: false).get();
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      List<Map<String, dynamic>> items =
          List<Map<String, dynamic>>.from(data['items']);
      return Receipt(
        address: data['address'],
        tel: data['tel'],
        time: (data['time'] as Timestamp).toDate(),
        item: items,
        id: doc.id,
      );
    }).toList();
  }

  void callGetReceipts() async {
    receiptList = await getReceipts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callGetReceipts();
  }

  void showAddReceipt() {
    _addressController.clear();
    _telController.clear();
    _itemsController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add Receipt',
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _telController,
                    decoration: const InputDecoration(labelText: 'Tel'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a telephone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _itemsController,
                    decoration: const InputDecoration(
                        labelText: 'Items (e.g. item1:2,item2:3)'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter items';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppPalette.primaryGreen),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        List<Map<String, int>> items =
                            _itemsController.text.split(',').map((e) {
                          var parts = e.split(':');
                          return {parts[0]: int.parse(parts[1])};
                        }).toList();
                        addReceipt(
                          Receipt(
                            address: _addressController.text,
                            tel: _telController.text,
                            time: DateTime.now(),
                            item: items,
                            id: '', // Placeholder for the ID
                          ),
                        ).then((_) {
                          Navigator.pop(context);
                          callGetReceipts();
                        });
                      }
                    },
                    child: const Text(
                      'Add Receipt',
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteReceipt(String id) {
    return receipts.doc(id).delete().then((_) {
      print("Receipt Deleted");
      callGetReceipts();
    }).catchError((error) => print("Failed to delete receipt: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipts'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  showAddReceipt();
                },
                child: const Text('Add Receipt')),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: receiptList.length,
              itemBuilder: (context, index) {
                Receipt receipt = receiptList[index];
                String formattedDate =
                    DateFormat('yyyy-MM-dd - H:m').format(receipt.time);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(formattedDate),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          showReceiptDetails(receipt);
                        },
                        child: const Text('Show Details'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showReceiptDetails(Receipt receipt) {
    _addressController.text = receipt.address;
    _telController.text = receipt.tel;
    _itemsController.text =
        receipt.item.map((e) => '${e.keys.first}:${e.values.first}').join(',');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Receipt Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address: ${receipt.address}'),
                Text('Tel: ${receipt.tel}'),
                Text(
                    'Time: ${DateFormat('yyyy-MM-dd – kk:mm').format(receipt.time)}'),
                Text(
                    'Items: ${receipt.item.map((e) => '${e.keys.first} x ${e.values.first}').join(', ')}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showUpdateReceipt(receipt);
              },
              child: const Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showDeleteConfirmationDialog(receipt);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void showUpdateReceipt(Receipt receipt) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Update Receipt',
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _telController,
                    decoration: const InputDecoration(labelText: 'Tel'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a telephone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _itemsController,
                    decoration: const InputDecoration(
                        labelText: 'Items (e.g. item1:2,item2:3)'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter items';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppPalette.primaryGreen),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        List<Map<String, int>> items =
                            _itemsController.text.split(',').map((e) {
                          var parts = e.split(':');
                          return {parts[0]: int.parse(parts[1])};
                        }).toList();
                        updateReceipt(
                          Receipt(
                            address: _addressController.text,
                            tel: _telController.text,
                            time: receipt.time,
                            item: items,
                            id: receipt.id,
                          ),
                        ).then((_) {
                          Navigator.pop(context);
                          callGetReceipts();
                        });
                      }
                    },
                    child: const Text(
                      'Update Receipt',
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(Receipt receipt) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Receipt'),
          content: const Text('Are you sure you want to delete this receipt?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteReceipt(receipt.id);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
