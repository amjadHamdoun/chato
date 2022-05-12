// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConversationState extends ConversationState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool showEmoji;
  @override
  final bool isRecord;
  @override
  final ConversationOldMessageModel conversationOldMessageModel;

  factory _$ConversationState(
          [void Function(ConversationStateBuilder)? updates]) =>
      (new ConversationStateBuilder()..update(updates)).build();

  _$ConversationState._(
      {this.isSuccess,
      this.isLoading,
      required this.showEmoji,
      required this.isRecord,
      required this.conversationOldMessageModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        showEmoji, 'ConversationState', 'showEmoji');
    BuiltValueNullFieldError.checkNotNull(
        isRecord, 'ConversationState', 'isRecord');
    BuiltValueNullFieldError.checkNotNull(conversationOldMessageModel,
        'ConversationState', 'conversationOldMessageModel');
  }

  @override
  ConversationState rebuild(void Function(ConversationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationStateBuilder toBuilder() =>
      new ConversationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        showEmoji == other.showEmoji &&
        isRecord == other.isRecord &&
        conversationOldMessageModel == other.conversationOldMessageModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                showEmoji.hashCode),
            isRecord.hashCode),
        conversationOldMessageModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversationState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('showEmoji', showEmoji)
          ..add('isRecord', isRecord)
          ..add('conversationOldMessageModel', conversationOldMessageModel))
        .toString();
  }
}

class ConversationStateBuilder
    implements Builder<ConversationState, ConversationStateBuilder> {
  _$ConversationState? _$v;

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

  ConversationOldMessageModel? _conversationOldMessageModel;
  ConversationOldMessageModel? get conversationOldMessageModel =>
      _$this._conversationOldMessageModel;
  set conversationOldMessageModel(
          ConversationOldMessageModel? conversationOldMessageModel) =>
      _$this._conversationOldMessageModel = conversationOldMessageModel;

  ConversationStateBuilder();

  ConversationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _showEmoji = $v.showEmoji;
      _isRecord = $v.isRecord;
      _conversationOldMessageModel = $v.conversationOldMessageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConversationState;
  }

  @override
  void update(void Function(ConversationStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConversationState build() {
    final _$result = _$v ??
        new _$ConversationState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            showEmoji: BuiltValueNullFieldError.checkNotNull(
                showEmoji, 'ConversationState', 'showEmoji'),
            isRecord: BuiltValueNullFieldError.checkNotNull(
                isRecord, 'ConversationState', 'isRecord'),
            conversationOldMessageModel: BuiltValueNullFieldError.checkNotNull(
                conversationOldMessageModel,
                'ConversationState',
                'conversationOldMessageModel'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
