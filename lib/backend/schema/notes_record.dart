import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_votes" field.
  int? _numVotes;
  int get numVotes => _numVotes ?? 0;
  bool hasNumVotes() => _numVotes != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "pdf_url" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "acc_sender" field.
  String? _accSender;
  String get accSender => _accSender ?? '';
  bool hasAccSender() => _accSender != null;

  // "num_downvotes" field.
  int? _numDownvotes;
  int get numDownvotes => _numDownvotes ?? 0;
  bool hasNumDownvotes() => _numDownvotes != null;

  // "downvotes" field.
  List<DocumentReference>? _downvotes;
  List<DocumentReference> get downvotes => _downvotes ?? const [];
  bool hasDownvotes() => _downvotes != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numVotes = castToType<int>(snapshotData['num_votes']);
    _tag = snapshotData['tag'] as String?;
    _pdfUrl = snapshotData['pdf_url'] as String?;
    _accSender = snapshotData['acc_sender'] as String?;
    _numDownvotes = castToType<int>(snapshotData['num_downvotes']);
    _downvotes = getDataList(snapshotData['downvotes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  String? postTitle,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numVotes,
  String? tag,
  String? pdfUrl,
  String? accSender,
  int? numDownvotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_votes': numVotes,
      'tag': tag,
      'pdf_url': pdfUrl,
      'acc_sender': accSender,
      'num_downvotes': numDownvotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postTitle == e2?.postTitle &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numVotes == e2?.numVotes &&
        e1?.tag == e2?.tag &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.accSender == e2?.accSender &&
        e1?.numDownvotes == e2?.numDownvotes &&
        listEquality.equals(e1?.downvotes, e2?.downvotes);
  }

  @override
  int hash(NotesRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numVotes,
        e?.tag,
        e?.pdfUrl,
        e?.accSender,
        e?.numDownvotes,
        e?.downvotes
      ]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
