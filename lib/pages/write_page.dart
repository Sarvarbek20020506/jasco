import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasco/models/notes_model.dart';
import 'package:jasco/servers/hive_notes.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool showKeyboard = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.ellipsis_circle,
              size: 28,
            ),
            const SizedBox(width: 10),
            showKeyboard
                ? GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        showKeyboard = false;
                      });
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Notes note = Notes(
                text: textEditingController.text,
                createTime: DateTime.now().toString().substring(0, 16));
            Navigator.pop(context, note);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.back),
              Text(
                "Notes",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CupertinoTextField(
              focusNode: focusNode,
              controller: textEditingController,
              autofocus: true,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: BoxDecoration(
                border: Border.all(
                  color: CupertinoColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
