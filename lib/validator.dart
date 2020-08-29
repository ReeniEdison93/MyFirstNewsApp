import 'dart:async';

mixin Validator{
  var userNameValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (userName,sink){
        if(userName == "Reeni123")
          sink.add(userName);
        else
          sink.addError("Invalid Username or Password");
        }

  );
  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if(password == "Reeni123")
          sink.add(password);
        else
          sink.addError("Invalid Username or Password");
      }
  );
}