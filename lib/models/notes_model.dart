import 'dart:convert';

class Notes {
  String? text;
  String? createTime;

  Notes({this.text, this.createTime});

  Notes.fromJson(Map<String, dynamic> map)
      : text = map['text'],
        createTime = map['createTime'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'createTime': createTime,
      };

  static List<Notes>? decode(String json){
    if(json == null)
    return jsonDecode(json).map<Notes>((e) => Notes.fromJson(e)).tolist();
  }

  static String encode(List<Notes> list)=>
    jsonEncode(list.map((e) => e.toJson()).toList());

}
