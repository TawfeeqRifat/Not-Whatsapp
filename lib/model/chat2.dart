class Chat2 {
  String name = 'hey';
  String icon =
      'https://cdn.pixabay.com/photo/2022/12/01/04/40/backpacker-7628303_1280.jpg';
  String message = 'me';

  void get(String a, String b, String c) {
    name = a;
    icon = b;
    message = c;
    print('element added');
  }

  void put() {
    print('$name\n$message');
  }
}
