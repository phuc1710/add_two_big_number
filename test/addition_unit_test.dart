import 'package:add_two_big_number/model/addition.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Small number', () {
    test('No carry + same length', () {
      var addition = Addition();
      addition.num1 = '123';
      addition.num2 = '234';
      expect(addition.addTwoLargeNumber(), equals('357'));
    });

    test('Carry + same length', () {
      var addition = Addition();
      addition.num1 = '123';
      addition.num2 = '777';
      expect(addition.addTwoLargeNumber(), equals('900'));
    });

    test('Carry + different lengths', () {
      var addition = Addition();
      addition.num1 = '123';
      addition.num2 = '7777';
      expect(addition.addTwoLargeNumber(), equals('7900'));
    });

    test('Overflow(w carry) + different lengths', () {
      var addition = Addition();
      addition.num1 = '923';
      addition.num2 = '9777';
      expect(addition.addTwoLargeNumber(), equals('10700'));
    });
  });

  group('Big number', () {
    test('No carry + same length', () {
      var addition = Addition();
      addition.num1 = '123456543212345654321';
      addition.num2 = '111111111111111111111';
      expect(addition.addTwoLargeNumber(), equals('234567654323456765432'));
    });

    test('Carry + same length', () {
      var addition = Addition();
      addition.num1 = '12345678987654321';
      addition.num2 = '11111111111111111';
      expect(addition.addTwoLargeNumber(), equals('23456790098765432'));
    });

    test('Carry + different lengths', () {
      var addition = Addition();
      addition.num1 = '12345678987654321';
      addition.num2 = '79';
      expect(addition.addTwoLargeNumber(), equals('12345678987654400'));
    });

    test('Overflow(w carry) + different lengths', () {
      var addition = Addition();
      addition.num1 = '11111111111111111';
      addition.num2 = '99999999999999999';
      expect(addition.addTwoLargeNumber(), equals('111111111111111110'));
    });
  });
}
