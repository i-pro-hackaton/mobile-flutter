import 'package:flutter/material.dart';
import 'package:nashe_delo/utilities/show_generic_dialog.dart';

Future<void> showSuccessDialog({
  required BuildContext context,
  required String content,
}) {
  return showGenereicDialog(
    context: context,
    title: "Успех!",
    content: content,
    optionsBuilder: () => {'Ура!': null},
  );
}
