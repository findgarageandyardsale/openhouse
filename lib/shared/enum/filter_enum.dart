///enum & extension for resource create source
enum FilterEnum { all, distance, type, category, price, sortBy }

extension FilterExtension on FilterEnum {
  String get source {
    switch (this) {
      case FilterEnum.all:
        return 'all';
      case FilterEnum.type:
        return 'type';
      case FilterEnum.category:
        return 'categories';
      case FilterEnum.distance:
        return 'distance';
      case FilterEnum.price:
        return 'price';
      case FilterEnum.sortBy:
        return 'sortBy';
    }
  }

  String get filterValue {
    switch (this) {
      case FilterEnum.all:
        return 'All';
      case FilterEnum.price:
        return 'Price';
      case FilterEnum.distance:
        return 'Distance';
      case FilterEnum.category:
        return 'Categories';
      case FilterEnum.type:
        return 'Type';
      case FilterEnum.sortBy:
        return 'Sort By';
    }
  }
}
