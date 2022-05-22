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
  final bool? isSuccessGet;
  @override
  final bool? isLoadingGet;
  @override
  final bool showEmoji;
  @override
  final bool isRecord;
  @override
  final PrivateOldMessageModel conversationOldMessageModel;
  @override
  final String error;

  factory _$ConversationState(
          [void Function(ConversationStateBuilder)? updates]) =>
      (new ConversationStateBuilder()..update(updates)).build();

  _$ConversationState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessGet,
      this.isLoadingGet,
      required this.showEmoji,
      required this.isRecord,
      required this.conversationOldMessageModel,
      required this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        showEmoji, 'ConversationState', 'showEmoji');
    BuiltValueNullFieldError.checkNotNull(
        isRecord, 'ConversationState', 'isRecord');
    BuiltValueNullFieldError.checkNotNull(conversationOldMessageModel,
        'ConversationState', 'conversationOldMessageModel');
    BuiltValueNullFieldError.checkNotNull(error, 'ConversationState', 'error');
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
        isSuccessGet == other.isSuccessGet &&
        isLoadingGet == other.isLoadingGet &&
        showEmoji == other.showEmoji &&
        isRecord == other.isRecord &&
        conversationOldMessageModel == other.conversationOldMessageModel &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                            isSuccessGet.hashCode),
                        isLoadingGet.hashCode),
                    showEmoji.hashCode),
                isRecord.hashCode),
            conversationOldMessageModel.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConversationState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessGet', isSuccessGet)
          ..add('isLoadingGet', isLoadingGet)
          ..add('showEmoji', showEmoji)
          ..add('isRecord', isRecord)
          ..add('conversationOldMessageModel', conversationOldMessageModel)
          ..add('error', error))
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

  bool? _isSuccessGet;
  bool? get isSuccessGet => _$this._isSuccessGet;
  set isSuccessGet(bool? isSuccessGet) => _$this._isSuccessGet = isSuccessGet;

  bool? _isLoadingGet;
  bool? get isLoadingGet => _$this._isLoadingGet;
  set isLoadingGet(bool? isLoadingGet) => _$this._isLoadingGet = isLoadingGet;

  bool? _showEmoji;
  bool? get showEmoji => _$this._showEmoji;
  set showEmoji(bool? showEmoji) => _$this._showEmoji = showEmoji;

  bool? _isRecord;
  bool? get isRecord => _$this._isRecord;
  set isRecord(bool? isRecord) => _$this._isRecord = isRecord;

  PrivateOldMessageModel? _conversationOldMessageModel;
  PrivateOldMessageModel? get conversationOldMessageModel =>
      _$this._conversationOldMessageModel;
  set conversationOldMessageModel(
          PrivateOldMessageModel? conversationOldMessageModel) =>
      _$this._conversationOldMessageModel = conversationOldMessageModel;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ConversationStateBuilder();

  ConversationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessGet = $v.isSuccessGet;
      _isLoadingGet = $v.isLoadingGet;
      _showEmoji = $v.showEmoji;
      _isRecord = $v.isRecord;
      _conversationOldMessageModel = $v.conversationOldMessageModel;
      _error = $v.error;
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
            isSuccessGet: isSuccessGet,
            isLoadingGet: isLoadingGet,
            showEmoji: BuiltValueNullFieldError.checkNotNull(
                showEmoji, 'ConversationState', 'showEmoji'),
            isRecord: BuiltValueNullFieldError.checkNotNull(
                isRecord, 'ConversationState', 'isRecord'),
            conversationOldMessageModel: BuiltValueNullFieldError.checkNotNull(
                conversationOldMessageModel,
                'ConversationState',
                'conversationOldMessageModel'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'ConversationState', 'error'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
