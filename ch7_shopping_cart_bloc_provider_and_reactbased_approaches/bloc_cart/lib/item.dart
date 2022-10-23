class Item {
  final String? name;
  final String? price;
  int _qty = 1;

  int get qty => _qty;

  Item({this.name, this.price});

  void incrementQty() => ++_qty;

  void decrementQty() => --_qty;
}

List<Item> populateItems() {
  return [
    Item(name: 'Keyboard', price: '24'),
    Item(name: 'Mouse', price: '20'),
    Item(name: 'LED Screen', price: '44'),
    Item(name: 'Mackbook', price: '240'),
    Item(name: 'Surface Book', price: '204'),
    Item(name: 'iMac', price: '248'),
    Item(name: 'Headphones', price: '29'),
    Item(name: 'USB Storage', price: '19'),
    Item(name: 'HDD', price: '23'),
  ];
}
