import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesMonthlyRecord extends FirestoreRecord {
  NotesMonthlyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "upload_count" field.
  int? _uploadCount;
  int get uploadCount => _uploadCount ?? 0;
  bool hasUploadCount() => _uploadCount != null;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  bool hasMonth() => _month != null;

  void _initializeFields() {
    _uploadCount = castToType<int>(snapshotData['upload_count']);
    _month = castToType<int>(snapshotData['month']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes_monthly');

  static Stream<NotesMonthlyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesMonthlyRecord.fromSnapshot(s));

  static Future<NotesMonthlyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesMonthlyRecord.fromSnapshot(s));

  static NotesMonthlyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotesMonthlyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesMonthlyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesMonthlyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesMonthlyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesMonthlyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesMonthlyRecordData({
  int? uploadCount,
  int? month,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'upload_count': uploadCount,
      'month': month,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesMonthlyRecordDocumentEquality
    implements Equality<NotesMonthlyRecord> {
  const NotesMonthlyRecordDocumentEquality();

  @override
  bool equals(NotesMonthlyRecord? e1, NotesMonthlyRecord? e2) {
    return e1?.uploadCount == e2?.uploadCount && e1?.month == e2?.month;
  }

  @override
  int hash(NotesMonthlyRecord? e) =>
      const ListEquality().hash([e?.uploadCount, e?.month]);

  @override
  bool isValidKey(Object? o) => o is NotesMonthlyRecord;
}
