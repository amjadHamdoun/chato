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
  final bool? isSuccessAllType;
  @override
  final bool? isLoadingAllType;
  @override
  final bool showEmoji;
  @override
  final bool isRecord;
  @override
  final bool smileOrSticker;
  @override
  final int senGiftType;
  @override
  final String smile;
  @override
  final String error;
  @override
  final ConversationOldMessageModel conversationOldMessageModel;
  @override
  final AllTypeModel allTypeModel;
  @override
  final AllTypeModel allTypeOwner;
  @override
  final AllTypeModel allTypeAdmin;
  @override
  final SendMessageModel sendMessageModel;

  factory _$RoomConversationState(
          [void Function(RoomConversationStateBuilder)? updates]) =>
      (new RoomConversationStateBuilder()..update(updates)).build();

  _$RoomConversationState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessAllType,
      this.isLoadingAllType,
      required this.showEmoji,
      required this.isRecord,
      required this.smileOrSticker,
      required this.senGiftType,
      required this.smile,
      required this.error,
      required this.conversationOldMessageModel,
      required this.allTypeModel,
      required this.allTypeOwner,
      required this.allTypeAdmin,
      required this.sendMessageModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        showEmoji, 'RoomConversationState', 'showEmoji');
    BuiltValueNullFieldError.checkNotNull(
        isRecord, 'RoomConversationState', 'isRecord');
    BuiltValueNullFieldError.checkNotNull(
        smileOrSticker, 'RoomConversationState', 'smileOrSticker');
    BuiltValueNullFieldError.checkNotNull(
        senGiftType, 'RoomConversationState', 'senGiftType');
    BuiltValueNullFieldError.checkNotNull(
        smile, 'RoomConversationState', 'smile');
    BuiltValueNullFieldError.checkNotNull(
        error, 'RoomConversationState', 'error');
    BuiltValueNullFieldError.checkNotNull(conversationOldMessageModel,
        'RoomConversationState', 'conversationOldMessageModel');
    BuiltValueNullFieldError.checkNotNull(
        allTypeModel, 'RoomConversationState', 'allTypeModel');
    BuiltValueNullFieldError.checkNotNull(
        allTypeOwner, 'RoomConversationState', 'allTypeOwner');
    BuiltValueNullFieldError.checkNotNull(
        allTypeAdmin, 'RoomConversationState', 'allTypeAdmin');
    BuiltValueNullFieldError.checkNotNull(
        sendMessageModel, 'RoomConversationState', 'sendMessageModel');
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
        isSuccessAllType == other.isSuccessAllType &&
        isLoadingAllType == other.isLoadingAllType &&
        showEmoji == other.showEmoji &&
        isRecord == other.isRecord &&
        smileOrSticker == other.smileOrSticker &&
        senGiftType == other.senGiftType &&
        smile == other.smile &&
        error == other.error &&
        conversationOldMessageModel == other.conversationOldMessageModel &&
        allTypeModel == other.allTypeModel &&
        allTypeOwner == other.allTypeOwner &&
        allTypeAdmin == other.allTypeAdmin &&
        sendMessageModel == other.sendMessageModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                isSuccess
                                                                    .hashCode),
                                                            isLoading.hashCode),
                                                        isSuccessAllType
                                                            .hashCode),
                                                    isLoadingAllType.hashCode),
                                                showEmoji.hashCode),
                                            isRecord.hashCode),
                                        smileOrSticker.hashCode),
                                    senGiftType.hashCode),
                                smile.hashCode),
                            error.hashCode),
                        conversationOldMessageModel.hashCode),
                    allTypeModel.hashCode),
                allTypeOwner.hashCode),
            allTypeAdmin.hashCode),
        sendMessageModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RoomConversationState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessAllType', isSuccessAllType)
          ..add('isLoadingAllType', isLoadingAllType)
          ..add('showEmoji', showEmoji)
          ..add('isRecord', isRecord)
          ..add('smileOrSticker', smileOrSticker)
          ..add('senGiftType', senGiftType)
          ..add('smile', smile)
          ..add('error', error)
          ..add('conversationOldMessageModel', conversationOldMessageModel)
          ..add('allTypeModel', allTypeModel)
          ..add('allTypeOwner', allTypeOwner)
          ..add('allTypeAdmin', allTypeAdmin)
          ..add('sendMessageModel', sendMessageModel))
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

  bool? _isSuccessAllType;
  bool? get isSuccessAllType => _$this._isSuccessAllType;
  set isSuccessAllType(bool? isSuccessAllType) =>
      _$this._isSuccessAllType = isSuccessAllType;

  bool? _isLoadingAllType;
  bool? get isLoadingAllType => _$this._isLoadingAllType;
  set isLoadingAllType(bool? isLoadingAllType) =>
      _$this._isLoadingAllType = isLoadingAllType;

  bool? _showEmoji;
  bool? get showEmoji => _$this._showEmoji;
  set showEmoji(bool? showEmoji) => _$this._showEmoji = showEmoji;

  bool? _isRecord;
  bool? get isRecord => _$this._isRecord;
  set isRecord(bool? isRecord) => _$this._isRecord = isRecord;

  bool? _smileOrSticker;
  bool? get smileOrSticker => _$this._smileOrSticker;
  set smileOrSticker(bool? smileOrSticker) =>
      _$this._smileOrSticker = smileOrSticker;

  int? _senGiftType;
  int? get senGiftType => _$this._senGiftType;
  set senGiftType(int? senGiftType) => _$this._senGiftType = senGiftType;

  String? _smile;
  String? get smile => _$this._smile;
  set smile(String? smile) => _$this._smile = smile;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ConversationOldMessageModel? _conversationOldMessageModel;
  ConversationOldMessageModel? get conversationOldMessageModel =>
      _$this._conversationOldMessageModel;
  set conversationOldMessageModel(
          ConversationOldMessageModel? conversationOldMessageModel) =>
      _$this._conversationOldMessageModel = conversationOldMessageModel;

  AllTypeModel? _allTypeModel;
  AllTypeModel? get allTypeModel => _$this._allTypeModel;
  set allTypeModel(AllTypeModel? allTypeModel) =>
      _$this._allTypeModel = allTypeModel;

  AllTypeModel? _allTypeOwner;
  AllTypeModel? get allTypeOwner => _$this._allTypeOwner;
  set allTypeOwner(AllTypeModel? allTypeOwner) =>
      _$this._allTypeOwner = allTypeOwner;

  AllTypeModel? _allTypeAdmin;
  AllTypeModel? get allTypeAdmin => _$this._allTypeAdmin;
  set allTypeAdmin(AllTypeModel? allTypeAdmin) =>
      _$this._allTypeAdmin = allTypeAdmin;

  SendMessageModel? _sendMessageModel;
  SendMessageModel? get sendMessageModel => _$this._sendMessageModel;
  set sendMessageModel(SendMessageModel? sendMessageModel) =>
      _$this._sendMessageModel = sendMessageModel;

  RoomConversationStateBuilder();

  RoomConversationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessAllType = $v.isSuccessAllType;
      _isLoadingAllType = $v.isLoadingAllType;
      _showEmoji = $v.showEmoji;
      _isRecord = $v.isRecord;
      _smileOrSticker = $v.smileOrSticker;
      _senGiftType = $v.senGiftType;
      _smile = $v.smile;
      _error = $v.error;
      _conversationOldMessageModel = $v.conversationOldMessageModel;
      _allTypeModel = $v.allTypeModel;
      _allTypeOwner = $v.allTypeOwner;
      _allTypeAdmin = $v.allTypeAdmin;
      _sendMessageModel = $v.sendMessageModel;
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
            isSuccessAllType: isSuccessAllType,
            isLoadingAllType: isLoadingAllType,
            showEmoji: BuiltValueNullFieldError.checkNotNull(
                showEmoji, 'RoomConversationState', 'showEmoji'),
            isRecord: BuiltValueNullFieldError.checkNotNull(
                isRecord, 'RoomConversationState', 'isRecord'),
            smileOrSticker: BuiltValueNullFieldError.checkNotNull(
                smileOrSticker, 'RoomConversationState', 'smileOrSticker'),
            senGiftType: BuiltValueNullFieldError.checkNotNull(
                senGiftType, 'RoomConversationState', 'senGiftType'),
            smile: BuiltValueNullFieldError.checkNotNull(
                smile, 'RoomConversationState', 'smile'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'RoomConversationState', 'error'),
            conversationOldMessageModel: BuiltValueNullFieldError.checkNotNull(
                conversationOldMessageModel, 'RoomConversationState', 'conversationOldMessageModel'),
            allTypeModel: BuiltValueNullFieldError.checkNotNull(
                allTypeModel, 'RoomConversationState', 'allTypeModel'),
            allTypeOwner: BuiltValueNullFieldError.checkNotNull(allTypeOwner, 'RoomConversationState', 'allTypeOwner'),
            allTypeAdmin: BuiltValueNullFieldError.checkNotNull(allTypeAdmin, 'RoomConversationState', 'allTypeAdmin'),
            sendMessageModel: BuiltValueNullFieldError.checkNotNull(sendMessageModel, 'RoomConversationState', 'sendMessageModel'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
