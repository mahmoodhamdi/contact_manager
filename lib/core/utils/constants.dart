import 'package:flutter/material.dart';

const String kBox = 'user';

messageIfUndo(context, cubitUsed, scaffoldMessenger, message) {
  Future.delayed(const Duration(seconds: 3))
      .whenComplete(() => scaffoldMessenger?.hideCurrentMaterialBanner());
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      backgroundColor: Colors.green,
      padding: const EdgeInsets.only(left: 16, right: 8),
      contentTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            // cubitUsed.notes?.last.delete();
            // scaffoldMessenger?.hideCurrentMaterialBanner();
            // cubitUsed.getNote();
          },
          child: const Text('Undo',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ),
  );
}
