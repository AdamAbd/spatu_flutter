/// registered = User succesfully register the account
/// promo = Show all discount and promo in app
enum NotificationType { registered, promo }

class NotificationItemEntity {
  final String label;
  final NotificationType type;
  final String desc;

  NotificationItemEntity({
    required this.label,
    required this.type,
    required this.desc,
  });
}

class NotificationEntity {
  final String dateToHuman;
  final List<NotificationItemEntity> item;

  const NotificationEntity({
    required this.dateToHuman,
    required this.item,
  });

  static final list = [
    NotificationEntity(
      dateToHuman: "Today",
      item: [
        NotificationItemEntity(
          label: "50% Special Discount!",
          type: NotificationType.promo,
          desc: "Special promotion for all shoes",
        ),
        NotificationItemEntity(
          label: "90% Special Discount!",
          type: NotificationType.promo,
          desc: "Special promotion only new account",
        ),
      ],
    ),
    NotificationEntity(
      dateToHuman: "Yesterday",
      item: [
        NotificationItemEntity(
          label: "Account Setup Successful!",
          type: NotificationType.registered,
          desc: "Your account has been created!",
        ),
      ],
    ),
  ];
}
