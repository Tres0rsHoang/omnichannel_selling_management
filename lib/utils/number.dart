String standardizeDecimalNumber(int number, [String point = '.']) {
  return number.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => point,
      );
}
