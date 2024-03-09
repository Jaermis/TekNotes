import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "acc_type" field.
  String? _accType;
  String get accType => _accType ?? '';
  bool hasAccType() => _accType != null;

  // "id_num" field.
  String? _idNum;
  String get idNum => _idNum ?? '';
  bool hasIdNum() => _idNum != null;

  // "fb_link" field.
  String? _fbLink;
  String get fbLink => _fbLink ?? '';
  bool hasFbLink() => _fbLink != null;

  // "github_link" field.
  String? _githubLink;
  String get githubLink => _githubLink ?? '';
  bool hasGithubLink() => _githubLink != null;

  // "linkedin_link" field.
  String? _linkedinLink;
  String get linkedinLink => _linkedinLink ?? '';
  bool hasLinkedinLink() => _linkedinLink != null;

  // "personal_link" field.
  String? _personalLink;
  String get personalLink => _personalLink ?? '';
  bool hasPersonalLink() => _personalLink != null;

  // "user_course" field.
  String? _userCourse;
  String get userCourse => _userCourse ?? '';
  bool hasUserCourse() => _userCourse != null;

  // "flaggedPosts" field.
  int? _flaggedPosts;
  int get flaggedPosts => _flaggedPosts ?? 0;
  bool hasFlaggedPosts() => _flaggedPosts != null;

  // "banned" field.
  bool? _banned;
  bool get banned => _banned ?? false;
  bool hasBanned() => _banned != null;

  // "time_banned" field.
  DateTime? _timeBanned;
  DateTime? get timeBanned => _timeBanned;
  bool hasTimeBanned() => _timeBanned != null;

  // "contribution_points" field.
  int? _contributionPoints;
  int get contributionPoints => _contributionPoints ?? 0;
  bool hasContributionPoints() => _contributionPoints != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "last_notification_read_time" field.
  DateTime? _lastNotificationReadTime;
  DateTime? get lastNotificationReadTime => _lastNotificationReadTime;
  bool hasLastNotificationReadTime() => _lastNotificationReadTime != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fullName = snapshotData['full_name'] as String?;
    _accType = snapshotData['acc_type'] as String?;
    _idNum = snapshotData['id_num'] as String?;
    _fbLink = snapshotData['fb_link'] as String?;
    _githubLink = snapshotData['github_link'] as String?;
    _linkedinLink = snapshotData['linkedin_link'] as String?;
    _personalLink = snapshotData['personal_link'] as String?;
    _userCourse = snapshotData['user_course'] as String?;
    _flaggedPosts = castToType<int>(snapshotData['flaggedPosts']);
    _banned = snapshotData['banned'] as bool?;
    _timeBanned = snapshotData['time_banned'] as DateTime?;
    _contributionPoints = castToType<int>(snapshotData['contribution_points']);
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _lastNotificationReadTime =
        snapshotData['last_notification_read_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? fullName,
  String? accType,
  String? idNum,
  String? fbLink,
  String? githubLink,
  String? linkedinLink,
  String? personalLink,
  String? userCourse,
  int? flaggedPosts,
  bool? banned,
  DateTime? timeBanned,
  int? contributionPoints,
  DateTime? lastNotificationReadTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'acc_type': accType,
      'id_num': idNum,
      'fb_link': fbLink,
      'github_link': githubLink,
      'linkedin_link': linkedinLink,
      'personal_link': personalLink,
      'user_course': userCourse,
      'flaggedPosts': flaggedPosts,
      'banned': banned,
      'time_banned': timeBanned,
      'contribution_points': contributionPoints,
      'last_notification_read_time': lastNotificationReadTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fullName == e2?.fullName &&
        e1?.accType == e2?.accType &&
        e1?.idNum == e2?.idNum &&
        e1?.fbLink == e2?.fbLink &&
        e1?.githubLink == e2?.githubLink &&
        e1?.linkedinLink == e2?.linkedinLink &&
        e1?.personalLink == e2?.personalLink &&
        e1?.userCourse == e2?.userCourse &&
        e1?.flaggedPosts == e2?.flaggedPosts &&
        e1?.banned == e2?.banned &&
        e1?.timeBanned == e2?.timeBanned &&
        e1?.contributionPoints == e2?.contributionPoints &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.lastNotificationReadTime == e2?.lastNotificationReadTime;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.fullName,
        e?.accType,
        e?.idNum,
        e?.fbLink,
        e?.githubLink,
        e?.linkedinLink,
        e?.personalLink,
        e?.userCourse,
        e?.flaggedPosts,
        e?.banned,
        e?.timeBanned,
        e?.contributionPoints,
        e?.followers,
        e?.following,
        e?.lastNotificationReadTime
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
