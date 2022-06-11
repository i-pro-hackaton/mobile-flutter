import 'package:flutter/material.dart';
import 'package:nashe_delo/utilities/show_generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenereicDialog<bool>(
    context: context,
    title: 'Выход',
    content: 'Вы действительно хотите выйти из аккаунта?',
    optionsBuilder: () => {'Отмена': false, 'Выйти': true},
  ).then((result) => result ?? false);
}
