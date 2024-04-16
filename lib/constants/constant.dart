import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff2B475E);
const kLogo = 'assets/images/scholar.png';
const kMessagesCollections = 'messages';
const kMessage = 'message';
const kCreatedAt = 'createdAt';
const kId = 'id';

extension NavigateTo on BuildContext {
  goTo(pageView) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => pageView));
  }

  goBack() {
    Navigator.pop(this);
  }

  gotoPushName(routeName) {
    Navigator.pushNamed(this, routeName);
  }

  goToAndKillLastWidget({required String routeName, required dynamic arg}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
        arguments: arg);
  }
}

Route<MaterialPageRoute<dynamic>> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.id:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case RegisterPage.id:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case ChatPage.id:
      return MaterialPageRoute(builder: (context) => ChatPage());

    default:
      //this is the first Page When app opened
      return MaterialPageRoute(builder: (context) => const LoginPage());
  }
}
