class Receipt {
  final String address;
  final String tel;
  final DateTime time;
  final List<Map<String, dynamic>> item;
  final String id;

  Receipt({
    required this.address,
    required this.tel,
    required this.time,
    required this.item,
    required this.id,
  });
}
