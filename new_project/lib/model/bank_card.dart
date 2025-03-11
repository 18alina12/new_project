import 'package:json_annotation/json_annotation.dart';

part 'bank_card.g.dart';

@JsonSerializable()
class BankCard {
  final int userId;
  final int id;
  final String title;
  final String body;

  BankCard({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory BankCard.fromJson(Map<String, dynamic> json) =>
      _$BankCardFromJson(json);
  Map<String, dynamic> toJson() => _$BankCardToJson(this);
}
