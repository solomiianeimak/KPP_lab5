import 'package:flutter_test/flutter_test.dart';
import 'package:lab_5/main.dart'; 

void main() {

    test('validates correct email format', () {
        expect(validateEmail('test@example.com'), true);
        expect(validateEmail('test.test123@example.com'), true);
        expect(validateEmail('test@third.second.top'), true);
        expect(validateEmail('wrong@'), false);
        expect(validateEmail('wrong@example'), false);
        expect(validateEmail(''), false);
    });

    test('validates password length', () {
        expect(validatePassword('123456'), true);
        expect(validatePassword('123456789'), true);
        expect(validatePassword('123'), false);
        expect(validatePassword(''), false);
    });
}