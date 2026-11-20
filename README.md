# Dart OOP Assignment: Kigali Bus Card

**Name:** Student 152302019 (replace with your full name)  
**Student ID:** 152302019

## My numbers
- D = 19
- L = 9
- Starting balance = 1000 + (10 × 10) = **1100 RWF**
- Bus fare = 0 + 19 = **019 RWF**
- Student discount = 10 + 0 = **10%**

## Output of main.dart

```text
Owner: Student 152302019 | Balance: 1100 RWF
Owner: Student 152302019 | Balance: 1100 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 019 RWF
Paid 019 RWF
Owner: Student 152302019 | Balance: 2680 RWF
Student discount: 21 RWF
Paid 189 RWF
Owner: Student 152302019 | Balance: 911 RWF
Student card: 10% off
```

## Part 1: Why no setter for balance?

There is no direct setter for the balance because it could let someone change the balance to any amount without following the card's rules. The `topUp()` and `pay()` methods control how money is added or removed, so the balance stays protected.

## Part 2: What does ~/ do?

The `~/` operator performs integer division. It divides and returns a whole-number result, dropping the decimal part.

- `237 * 17 / 100` gives `40.29` (a decimal number).
- `237 * 17 ~/ 100` gives `40` (an integer).

This is useful for calculating a discount in whole RWF.

## Part 4: Bug table

| Bug | The line | Why it is wrong | Fix |
|---|---|---|---|
| 1 | `String _brand; int _battery;` | Non-nullable fields need initial values or must be initialized before use. | Initialize them, e.g. `String _brand = ''; int _battery = 0;`. |
| 2 | `SmartPhone(String brand, int battery, String system) { ... }` | The child constructor does not initialize the parent `Phone` fields. | Add `: super(brand, battery)` before the constructor body. |
| 3 | `@override void restart()` in `SmartPhone` | The parent class has no `restart()` method to override. | Define `restart()` in `Phone`. |
| 4 | `p.battery = 100;` | The original class has no setter, so this assignment is not allowed. | Add a setter that accepts values from 0 to 100. This line itself is intentional and should remain. |
| 5 | `print(p.battery());` | `battery` is a getter, not a method, so it must not be called with parentheses. | Use `print(p.battery);`. |

### Not a bug

`int get battery { return _battery; }` is correct. It is a getter, so reading `p.battery` returns the battery value without parentheses.

## Part 5

### My prediction

```text
1
3
```

The first `Bag` starts at 0. `add()` makes it 1. Assigning `-5` is rejected by the setter because it only accepts values at least 0, so it remains 1.

`BigBag.add()` calls the parent's `add()` twice, so the items become 2. Then `b.items = b.items + 1` adds one more, giving 3.

### Real output

```text
1
3
```

### Was I right?

Yes. My prediction matched the real output.

## GitHub commit checklist

Make at least these 5 commits, as required:

1. `Part 1: BusCard`
2. `Part 2 and 3: StudentCard and main`
3. `Part 4: bug hunt fixed`
4. `Part 5: prediction`
5. `Part 5: real output and README`

## How to run

From the project directory:

```bash
dart run main.dart
dart run bug_hunt.dart
```

For Part 5, create a separate file with the Bag/BigBag code from the assignment, commit your prediction first, then run it and add the real output to this README.

## Submission

Repository name: `dart-oop-152302019`

Keep the repository private and add your lecturer as a collaborator. Paste your repository link into the class submission platform before the deadline.
