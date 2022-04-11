// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_conversation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RoomConversationState extends RoomConversationState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool showEmoji;
  @override
  final bool isRecord;
  @override
  final int senGiftType;

  factory _$RoomConversationState(
          [void Function(RoomConversationStateBuilder)? updates]) =>
      (new RoomConversationStateBuilder()..update(updates)).build();

  _$RoomConversationState._(
      {this.isSuccess,
      this.isLoading,
      required this.showEmoji,
      required this.isRecord,
      required this.senGiftType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        showEmoji, 'RoomConversationState', 'showEmoji');
    BuiltValueNullFieldError.checkNotNull(
        isRecord, 'RoomConversationState', 'isRecord');
    BuiltValueNullFieldError.checkNotNull(
        senGiftType, 'RoomConversationState', 'senGiftType');
  }

  @override
  RoomConversationState rebuild(
          void Function(RoomConversationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomConversationStateBuilder toBuilder() =>
      new RoomConversationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomConversationState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        showEmoji == other.showEmoji &&
        isRecord == other.isRecord &&
        senGiftType == other.senGiftType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                showEmoji.hashCode),
            isRecord.hashCode),
        senGiftType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RoomConversationState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('showEmoji', showEmoji)
          ..add('isRecord', isRecord)
          ..add('senGiftType', senGiftType))
        .toString();
  }
}

class RoomConversationStateBuilder
    implements Builder<RoomConversationState, RoomConversationStateBuilder> {
  _$RoomConversationState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _showEmoji;
  bool? get showEmoji => _$this._showEmoji;
  set showEmoji(bool? showEmoji) => _$this._showEmoji = showEmoji;

  bool? _isRecord;
  bool? get isRecord => _$this._isRecord;
  set isRecord(bool? isRecord) => _$this._isRecord = isRecord;

  int? _senGiftType;
  int? get senGiftType => _$this._senGiftType;
  set senGiftType(int? senGiftType) => _$this._senGiftType = senGiftType;

  RoomConversationStateBuilder();

  RoomConversationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _showEmoji = $v.showEmoji;
      _isRecord = $v.isRecord;
      _senGiftType = $v.senGiftType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomConversationState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoomConversationState;
  }

  @override
  void update(void Function(RoomConversationStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RoomConversationState build() {
    final _$result = _$v ??
        new _$RoomConversationState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            showEmoji: BuiltValueNullFieldError.checkNotNull(
                showEmoji, 'RoomConversationState', 'showEmoji'),
            isRecord: BuiltValueNullFieldError.checkNotNull(
                isRecord, 'RoomConversationState', 'isRecord'),
            senGiftType: BuiltValueNullFieldError.checkNotNull(
                senGiftType, 'RoomConversationState', 'senGiftType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
