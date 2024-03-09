import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SignupAnalyticsRecord extends FirestoreRecord {
  SignupAnalyticsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "week_count" field.
  int? _weekCount;
  int get weekCount => _weekCount ?? 0;
  bool hasWeekCount() => _weekCount != null;

  // "month_count" field.
  int? _monthCount;
  int get monthCount => _monthCount ?? 0;
  bool hasMonthCount() => _monthCount != null;

  // "year_count" field.
  int? _yearCount;
  int get yearCount => _yearCount ?? 0;
  bool hasYearCount() => _yearCount != null;

  // "month" field.
  DateTime? _month;
  DateTime? get month => _month;
  bool hasMonth() => _month != null;

  // "week" field.
  DateTime? _week;
  DateTime? get week => _week;
  bool hasWeek() => _week != null;

  // "year" field.
  DateTime? _year;
  DateTime? get year => _year;
  bool hasYear() => _year != null;

  void _initializeFields() {
    _weekCount = castToType<int>(snapshotData['week_count']);
    _monthCount = castToType<int>(snapshotData['month_count']);
    _yearCount = castToType<int>(snapshotData['year_count']);
    _month = snapshotData['month'] as DateTime?;
    _week = snapshotData['week'] as DateTime?;
    _year = snapshotData['year'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('signup_analytics');

  static Stream<SignupAnalyticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SignupAnalyticsRecord.fromSnapshot(s));

  static Future<SignupAnalyticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SignupAnalyticsRecord.fromSnapshot(s));

  static SignupAnalyticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SignupAnalyticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SignupAnalyticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SignupAnalyticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SignupAnalyticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SignupAnalyticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSignupAnalyticsRecordData({
  int? weekCount,
  int? monthCount,
  int? yearCount,
  DateTime? month,
  DateTime? week,
  DateTime? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'week_count': weekCount,
      'month_count': monthCount,
      'year_count': yearCount,
      'month': month,
      'week': week,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class SignupAnalyticsRecordDocumentEquality
    implements Equality<SignupAnalyticsRecord> {
  const SignupAnalyticsRecordDocumentEquality();

  @override
  bool equals(SignupAnalyticsRecord? e1, SignupAnalyticsRecord? e2) {
    return e1?.weekCount == e2?.weekCount &&
        e1?.monthCount == e2?.monthCount &&
        e1?.yearCount == e2?.yearCount &&
        e1?.month == e2?.month &&
        e1?.week == e2?.week &&
        e1?.year == e2?.year;
  }

  @override
  int hash(SignupAnalyticsRecord? e) => const ListEquality().hash(
      [e?.weekCount, e?.monthCount, e?.yearCount, e?.month, e?.week, e?.year]);

  @override
  bool isValidKey(Object? o) => o is SignupAnalyticsRecord;
}
