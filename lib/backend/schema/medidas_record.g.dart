// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medidas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MedidasRecord> _$medidasRecordSerializer =
    new _$MedidasRecordSerializer();

class _$MedidasRecordSerializer implements StructuredSerializer<MedidasRecord> {
  @override
  final Iterable<Type> types = const [MedidasRecord, _$MedidasRecord];
  @override
  final String wireName = 'MedidasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MedidasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.tensao;
    if (value != null) {
      result
        ..add('tensao')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MedidasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedidasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tensao':
          result.tensao = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MedidasRecord extends MedidasRecord {
  @override
  final int? tensao;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MedidasRecord([void Function(MedidasRecordBuilder)? updates]) =>
      (new MedidasRecordBuilder()..update(updates))._build();

  _$MedidasRecord._({this.tensao, this.ffRef}) : super._();

  @override
  MedidasRecord rebuild(void Function(MedidasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedidasRecordBuilder toBuilder() => new MedidasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedidasRecord &&
        tensao == other.tensao &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, tensao.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedidasRecord')
          ..add('tensao', tensao)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MedidasRecordBuilder
    implements Builder<MedidasRecord, MedidasRecordBuilder> {
  _$MedidasRecord? _$v;

  int? _tensao;
  int? get tensao => _$this._tensao;
  set tensao(int? tensao) => _$this._tensao = tensao;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MedidasRecordBuilder() {
    MedidasRecord._initializeBuilder(this);
  }

  MedidasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tensao = $v.tensao;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedidasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedidasRecord;
  }

  @override
  void update(void Function(MedidasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedidasRecord build() => _build();

  _$MedidasRecord _build() {
    final _$result = _$v ?? new _$MedidasRecord._(tensao: tensao, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
