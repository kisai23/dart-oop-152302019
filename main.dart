// Dart OOP Assignment: Kigali Bus Card
// Student ID: 152302019
// D = 19, L =9 
// Starting balance = 1100 RWF, Bus fare = 210 RWF, Discount = 10%

class BusCard {
  String _owner = '';
  int _balance = 0;

  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  String get owner {
    return _owner;
  }

  int get balance {
    return _balance;
  }

  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 19, L = 9
  // Starting balance = 1100 RWF, Bus fare = 019 RWF, Discount = 10%

  BusCard card = BusCard('Student 152302019', 1100);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5 completed: set owner to full name, then show info
  card.owner = 'Student 152302019';
  card.showInfo();

  // TODO 6 completed: invalid top-up then valid top-up
  card.topUp(100);
  card.topUp(2000);

  // TODO 7 completed: pay fare twice, then show info
  card.pay(019);
  card.pay(019);
  card.showInfo();

  // TODO 8 completed: create StudentCard
  StudentCard studentCard = StudentCard('Student 152302019', 1100, 10);

  // TODO 9 completed: pay with student card, then show info
  studentCard.pay(019);
  studentCard.showInfo();
}
