// import 'package:json_annotation/json_annotation.dart';
// 
// part 'journal.g.dart';
// 
// @JsonSerializable()
// class Journal {
//   String documentID;
//   String date;
//   String mood;
//   String note;
//   String uid;
// 
//   Journal({
//     this.documentID,
//     this.date,
//     this.mood,
//     this.note,
//     this.uid,
//   });
// 
//   /// A necessary factory constructor for creating a new Journal instance
//   /// from a map. Pass the map to the generated `_$JournalFromJson()` constructor.
//   /// The constructor is named after the source class, in this case, Journal.
//   factory Journal.fromJson(Map<String, dynamic> json) => _$JournalFromJson(json);
// 
//   /// `toJson` is the convention for a class to declare support for serialization
//   /// to JSON. The implementation simply calls the private, generated
//   /// helper method `_$JournalToJson`.
//   Map<String, dynamic> toJson() => _$JournalToJson(this);
// }
