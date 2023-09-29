class ScanNull<T> {
  ScanNull._();
  static T getInstance<T>(dynamic data) {
    try {
      if (data == null) {
        throw Exception();
      }

      return data as T;
    } catch (e) {
      rethrow;
    }
  }
}
