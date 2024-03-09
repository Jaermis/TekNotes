import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesAnalyticsRecord extends FirestoreRecord {
  NotesAnalyticsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notes_course" field.
  String? _notesCourse;
  String get notesCourse => _notesCourse ?? '';
  bool hasNotesCourse() => _notesCourse != null;

  // "upload_count" field.
  int? _uploadCount;
  int get uploadCount => _uploadCount ?? 0;
  bool hasUploadCount() => _uploadCount != null;

  void _initializeFields() {
    _notesCourse = snapshotData['notes_course'] as String?;
    _uploadCount = castToType<int>(snapshotData['upload_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes_analytics');

  static Stream<NotesAnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesAnalyticsRecord.fromSnapshot(s));

  static Future<NotesAnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesAnalyticsRecord.fromSnapshot(s));

  static NotesAnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotesAnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesAnalyticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesAnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesAnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesAnalyticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesAnalyticsRecordData({
  String? notesCourse,
  int? uploadCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notes_course': notesCourse,
      'upload_count': uploadCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesAnalyticsRecordDocumentEquality
    implements Equality<NotesAnalyticsRecord> {
  const NotesAnalyticsRecordDocumentEquality();

  @override
  bool equals(NotesAnalyticsRecord? e1, NotesAnalyticsRecord? e2) {
    return e1?.notesCourse == e2?.notesCourse &&
        e1?.uploadCount == e2?.uploadCount;
  }

  @override
  int hash(NotesAnalyticsRecord? e) =>
      const ListEquality().hash([e?.notesCourse, e?.uploadCount]);

  @override
  bool isValidKey(Object? o) => o is NotesAnalyticsRecord;
}
