import 'dart:async';
import 'package:sample_app/validator.dart';
import 'package:rxdart/rxdart.dart';

class MyBloc  with Validator implements baseBloc{

  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get userNameChanged => _userNameController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  @override
  void dispose() {
    _userNameController?.close();
    _passwordController?.close();
  }

  Stream<String> get userName => _userNameController.stream.transform(userNameValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck => Observable.combineLatest2(userName, password, (u, p) => true);


}
abstract class baseBloc{

  void dispose();
}