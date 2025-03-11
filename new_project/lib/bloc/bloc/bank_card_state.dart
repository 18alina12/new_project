part of 'bank_card_bloc.dart';

@immutable
sealed class BankCardState {}

final class BankCardInitial extends BankCardState {}

final class LoadingBankCardState extends BankCardState {}

final class FetchedBankCardState extends BankCardState {
  final List<BankCard> bankCard;
  FetchedBankCardState(this.bankCard);
}

final class FailureBankCardState extends BankCardState {}
