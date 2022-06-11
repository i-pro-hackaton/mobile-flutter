import 'package:flutter/material.dart';
import 'package:nashe_delo/utilities/show_generic_dialog.dart';

Future<void> showErrorDialog({
  required BuildContext context,
  required String content,
}) {
  return showGenereicDialog(
    context: context,
    title: "Ошибка",
    content: content,
    optionsBuilder: () => {'OK :(': null},
  );
}
