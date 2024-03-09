import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "quiz_ref" field.
  DocumentReference? _quizRef;
  DocumentReference? get quizRef => _quizRef;
  bool hasQuizRef() => _quizRef != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "interacted" field.
  DocumentReference? _interacted;
  DocumentReference? get interacted => _interacted;
  bool hasInteracted() => _interacted != null;

  // "note_ref" field.
  DocumentReference? _noteRef;
  DocumentReference? get noteRef => _noteRef;
  bool hasNoteRef() => _noteRef != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _notificationType = snapshotData['notification_type'] as String?;
    _quizRef = snapshotData['quiz_ref'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _seen = snapshotData['seen'] as bool?;
    _interacted = snapshotData['interacted'] as DocumentReference?;
    _noteRef = snapshotData['note_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  String? notificationType,
  DocumentReference? quizRef,
  DateTime? timePosted,
  String? message,
  bool? seen,
  DocumentReference? interacted,
  DocumentReference? noteRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'notification_type': notificationType,
      'quiz_ref': quizRef,
      'time_posted': timePosted,
      'message': message,
      'seen': seen,
      'interacted': interacted,
      'note_ref': noteRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.notificationType == e2?.notificationType &&
        e1?.quizRef == e2?.quizRef &&
        e1?.timePosted == e2?.timePosted &&
        e1?.message == e2?.message &&
        e1?.seen == e2?.seen &&
        e1?.interacted == e2?.interacted &&
        e1?.noteRef == e2?.noteRef;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.receiver,
        e?.notificationType,
        e?.quizRef,
        e?.timePosted,
        e?.message,
        e?.seen,
        e?.interacted,
        e?.noteRef
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
