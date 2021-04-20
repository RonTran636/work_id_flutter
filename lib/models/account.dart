class Account {
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  int? workId;
  String? photoUrl;
  String? password;
  String? fcmToken;
  String? lastSeen;
  bool? isOnline;
  bool? isActive;
  String? serverToken;
  bool? isMessagePinned;
  bool? strangerCall = false;
  bool? strangerInviteTopic = false;
  bool? strangerMessage = false;
  int? friendStatus = 0;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Account({
     this.customerId,
     this.customerName,
     this.customerEmail,
     this.customerPhone,
     this.workId,
     this.photoUrl,
     this.password,
     this.fcmToken,
     this.lastSeen,
     this.isOnline,
     this.isActive,
     this.serverToken,
     this.isMessagePinned,
     this.strangerCall,
     this.strangerInviteTopic,
     this.strangerMessage,
     this.friendStatus,
  });

  Account copyWith({
    required int customerId,
    required String customerName,
    required String customerEmail,
    required String customerPhone,
    required int workId,
    required String photoUrl,
    required String password,
    required String fcmToken,
    required String lastSeen,
    required bool isOnline,
    required bool isActive,
    required String serverToken,
    required bool isMessagePinned,
    required bool strangerCall,
    required bool strangerInviteTopic,
    required bool strangerMessage,
    required int friendStatus,
  }) {
    return new Account(
      customerId: customerId,
      customerName: customerName,
      customerEmail: customerEmail,
      customerPhone: customerPhone,
      workId: workId,
      photoUrl: photoUrl,
      password: password,
      fcmToken: fcmToken,
      lastSeen: lastSeen,
      isOnline: isOnline,
      isActive: isActive,
      serverToken: serverToken,
      isMessagePinned: isMessagePinned,
      strangerCall: strangerCall,
      strangerInviteTopic: strangerInviteTopic,
      strangerMessage: strangerMessage,
      friendStatus: friendStatus,
    );
  }

  @override
  String toString() {
    return 'Account{customerId: $customerId, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone, workId: $workId, photoUrl: $photoUrl, password: $password, fcmToken: $fcmToken, lastSeen: $lastSeen, isOnline: $isOnline, isActive: $isActive, serverToken: $serverToken, isMessagePinned: $isMessagePinned, strangerCall: $strangerCall, strangerInviteTopic: $strangerInviteTopic, strangerMessage: $strangerMessage, friendStatus: $friendStatus}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          runtimeType == other.runtimeType &&
          customerId == other.customerId &&
          customerName == other.customerName &&
          customerEmail == other.customerEmail &&
          customerPhone == other.customerPhone &&
          workId == other.workId &&
          photoUrl == other.photoUrl &&
          password == other.password &&
          fcmToken == other.fcmToken &&
          lastSeen == other.lastSeen &&
          isOnline == other.isOnline &&
          isActive == other.isActive &&
          serverToken == other.serverToken &&
          isMessagePinned == other.isMessagePinned &&
          strangerCall == other.strangerCall &&
          strangerInviteTopic == other.strangerInviteTopic &&
          strangerMessage == other.strangerMessage &&
          friendStatus == other.friendStatus);

  @override
  int get hashCode =>
      customerId.hashCode ^
      customerName.hashCode ^
      customerEmail.hashCode ^
      customerPhone.hashCode ^
      workId.hashCode ^
      photoUrl.hashCode ^
      password.hashCode ^
      fcmToken.hashCode ^
      lastSeen.hashCode ^
      isOnline.hashCode ^
      isActive.hashCode ^
      serverToken.hashCode ^
      isMessagePinned.hashCode ^
      strangerCall.hashCode ^
      strangerInviteTopic.hashCode ^
      strangerMessage.hashCode ^
      friendStatus.hashCode;

  factory Account.fromMap(Map<String, dynamic> map) {
    return new Account(
      customerId: map['customer_id'] as int,
      customerName: map['customer_name'] as String,
      customerEmail: map['customer_email'] as String,
      customerPhone: map['customer_phone'] as String?,
      workId: map['workid'] as int,
      photoUrl: map['photo_url'] as String?,
      password: map['password'] as String?,
      fcmToken: map['fcm_token'] as String,
      lastSeen: map['last_login'] as String?,
      isOnline: map['is_online'] as bool?,
      isActive: map['is_active'] as bool?,
      serverToken: map['token'] as String?,
      isMessagePinned: map['is_pin'] as bool?,
      strangerCall: map['only_friend_call'] as bool,
      strangerInviteTopic: map['only_friend_invite_topic'] as bool,
      strangerMessage: map['only_friend_chat'] as bool,
      friendStatus: map['friend_status'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'customer_id': this.customerId,
      'customer_name': this.customerName,
      'customer_email': this.customerEmail,
      'customer_phone': this.customerPhone,
      'workid': this.workId,
      'photo_url': this.photoUrl,
      'password': this.password,
      'fcm_token': this.fcmToken,
      'last_login': this.lastSeen,
      'is_online': this.isOnline,
      'is_active': this.isActive,
      'token': this.serverToken,
      'is_pin': this.isMessagePinned,
      'only_friend_call': this.strangerCall,
      'only_friend_invite_topic': this.strangerInviteTopic,
      'only_friend_chat': this.strangerMessage,
      'friend_status': this.friendStatus,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
