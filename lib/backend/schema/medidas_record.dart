import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'medidas_record.g.dart';

abstract class MedidasRecord
    implements Built<MedidasRecord, MedidasRecordBuilder> {
  static Serializer<MedidasRecord> get serializer => _$medidasRecordSerializer;

  int? get tensao;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MedidasRecordBuilder builder) =>
      builder..tensao = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medidas');

  static Stream<MedidasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MedidasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MedidasRecord._();
  factory MedidasRecord([void Function(MedidasRecordBuilder) updates]) =
      _$MedidasRecord;

  static MedidasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMedidasRecordData({
  int? tensao,
}) {
  final firestoreData = serializers.toFirestore(
    MedidasRecord.serializer,
    MedidasRecord(
      (m) => m..tensao = tensao,
    ),
  );

  return firestoreData;
}
