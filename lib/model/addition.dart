import 'dart:developer' as developer;

class Addition {
  String num1 = '', num2 = '';

  String addTwoLargeNumber() {
    developer.log('Number 1: $num1', name: 'Addition Input');
    developer.log('Number 2: $num2', name: 'Addition Input');
    List sumDigit = [];
    int carry = 0;
    int lengthToAdd = num1.length - num2.length;
    String zeros = "0" * lengthToAdd.abs();
    String result = '';

    if (lengthToAdd > 0) {
      num2 = zeros + num2;
    } else if (lengthToAdd < 0) {
      num1 = zeros + num1;
    }
    for (int i = num2.length - 1; i >= 0; --i) {
      int temp = int.parse(num2[i]) + int.parse(num1[i]) + carry;
      carry = 0;
      if (temp >= 10) {
        carry = 1;
        temp -= 10;
      }
      developer.log(
          '${int.parse(num1[i])} + ${int.parse(num2[i])} = $temp (carry $carry)',
          name: 'Addition Loop Iteration ${num2.length - i}');
      sumDigit.add(temp);
    }
    if (carry != 0) sumDigit.add(carry);

    result = sumDigit.reversed.toList().join();
    developer.log('Result: $result', name: 'Addition Result');
    return result;
  }
}
