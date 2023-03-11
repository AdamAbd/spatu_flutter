/// registered = User succesfully register the account
/// promo = Show all discount and promo in app
// enum SearchStoreType { registered, promo }

class SearchStoreItemEntity {
  final String label;
  final String brand;
  final int sold;
  final int price;

  SearchStoreItemEntity({
    required this.label,
    required this.brand,
    required this.sold,
    required this.price,
  });
}

class SearchStoreEntity {
  final String brand;
  final List<SearchStoreItemEntity> item;

  const SearchStoreEntity({
    required this.brand,
    required this.item,
  });

  static final list = [
    SearchStoreEntity(
      brand: "Nike",
      item: [
        SearchStoreItemEntity(
          label: "Metcon 8 Air",
          brand: "Nike",
          sold: 52214,
          price: 1799000,
        ),
        SearchStoreItemEntity(
          label: "Metcon 7",
          brand: "Nike",
          sold: 52214,
          price: 1799000,
        ),
      ],
    ),
    SearchStoreEntity(
      brand: "Adidas",
      item: [
        SearchStoreItemEntity(
          label: "Metcon 7",
          brand: "Adidas",
          sold: 10291,
          price: 1799000,
        ),
      ],
    ),
  ];
}
