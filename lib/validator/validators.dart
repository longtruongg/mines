import 'dart:async';

class Validators {
  final StreamTransformer<String, String> emailVali =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@") && email.contains("."))
      sink.add(email);
    else if (email.length > 0) sink.addError("please enter email !");
  });
  final StreamTransformer<String, String> passVali =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length >= 6)
      sink.add(pass);
    else if (pass.length > 0)
      sink.addError("password needs to be at least 6 chars");
  });
}
