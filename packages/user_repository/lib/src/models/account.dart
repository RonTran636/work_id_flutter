import 'package:equatable/equatable.dart';

class Account extends Equatable {
	final int? customerId;
	final int? workid;
	final dynamic fcmToken;
	final dynamic photoUrl;
	final String? customerName;
	final String? customerEmail;
	final dynamic customerPhone;
	final String? token;
	final dynamic lastLogin;
	final bool? isActive;

	const Account({
		this.customerId,
		this.workid,
		this.fcmToken,
		this.photoUrl,
		this.customerName,
		this.customerEmail,
		this.customerPhone,
		this.token,
		this.lastLogin,
		this.isActive,
	});

	@override
	String toString() {
		return 'Account(customerId: $customerId, workid: $workid, fcmToken: $fcmToken, photoUrl: $photoUrl, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone, token: $token, lastLogin: $lastLogin, isActive: $isActive)';
	}

	factory Account.fromJson(Map<String, dynamic> json) {
		return Account(
			customerId: json['customer_id'] as int,
			workid: json['workid'] as int,
			fcmToken: json['fcm_token'] as dynamic,
			photoUrl: json['photo_url'] as dynamic,
			customerName: json['customer_name'] as String,
			customerEmail: json['customer_email'] as String,
			customerPhone: json['customer_phone'] as dynamic,
			token: json['token'] as String,
			lastLogin: json['last_login'] as dynamic,
			isActive: json['is_active'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'customer_id': customerId,
			'workid': workid,
			'fcm_token': fcmToken,
			'photo_url': photoUrl,
			'customer_name': customerName,
			'customer_email': customerEmail,
			'customer_phone': customerPhone,
			'token': token,
			'last_login': lastLogin,
			'is_active': isActive,
		};
	}

	@override
	List<Object?> get props {
		return [
			customerId,
			workid,
			fcmToken,
			photoUrl,
			customerName,
			customerEmail,
			customerPhone,
			token,
			lastLogin,
			isActive,
		];
	}

  static const empty = Account();
}
