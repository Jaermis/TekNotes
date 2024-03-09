import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FollowingRecord extends FirestoreRecord {
  FollowingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_followed" field.
  DocumentReference? _userFollowed;
  DocumentReference? get userFollowed => _userFollowed;
  bool hasUserFollowed() => _userFollowed != null;

  // "user_who_followed_who" field.
  DocumentReference? _userWhoFollowedWho;
  DocumentReference? get userWhoFollowedWho => _userWhoFollowedWho;
  bool hasUserWhoFollowedWho() => _userWhoFollowedWho != null;

  void _initializeFields() {
    _userFollowed = snapshotData['user_followed'] as DocumentReference?;
    _userWhoFollowedWho =
        snapshotData['user_who_followed_who'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('following');

  static Stream<FollowingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FollowingRecord.fromSnapshot(s));

  static Future<FollowingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FollowingRecord.fromSnapshot(s));

  static FollowingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FollowingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FollowingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FollowingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FollowingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FollowingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFollowingRecordData({
  DocumentReference? userFollowed,
  DocumentReference? userWhoFollowedWho,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_followed': userFollowed,
      'user_who_followed_who': userWhoFollowedWho,
    }.withoutNulls,
  );

  return firestoreData;
}

class FollowingRecordDocumentEquality implements Equality<FollowingRecord> {
  const FollowingRecordDocumentEquality();

  @override
  bool equals(FollowingRecord? e1, FollowingRecord? e2) {
    return e1?.userFollowed == e2?.userFollowed &&
        e1?.userWhoFollowedWho == e2?.userWhoFollowedWho;
  }

  @override
  int hash(FollowingRecord? e) =>
      const ListEquality().hash([e?.userFollowed, e?.userWhoFollowedWho]);

  @override
  bool isValidKey(Object? o) => o is FollowingRecord;
}
