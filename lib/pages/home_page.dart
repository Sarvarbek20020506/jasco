import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasco/pages/write_page.dart';
import 'package:jasco/servers/hive_notes.dart';

import '../models/notes_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Notes> _list = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = HiveDB.getNote(_list);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, scroll) => const [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Notes"),
            trailing: Icon(CupertinoIcons.ellipsis_circle),
          ),
        ],
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.separated(
              itemCount: _list.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: index == 0
                        ? const BorderRadius.vertical(top:  Radius.circular(15))
                        : index == _list.length - 1
                            ? const BorderRadius.vertical(bottom:  Radius.circular(15))
                            : BorderRadius.circular(0)),
                margin: EdgeInsets.zero,
                elevation: 0,
                color: CupertinoColors.secondaryLabel.withOpacity(0.4),
                child: ListTile(
                  textColor: Colors.white,
                  title: Text(_list[index].text!),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  indent: 15,
                  thickness: 0.2,
                  color: CupertinoColors.systemGrey,
                  height: 0.2,
                );
              },
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.only(right: 25),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () async {
                    Notes result = await Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const WritePage()));
                    _list.add(result);
                    setState(() {});
                    HiveDB.setNote(_list);
                  },
                  child: const Icon(CupertinoIcons.add)),
            ),
          ],
        ),
      ),
    );
  }
}
