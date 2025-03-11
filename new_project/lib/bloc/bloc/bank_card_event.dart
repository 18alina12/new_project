part of 'bank_card_bloc.dart';

@immutable
sealed class BankCardEvent {}

class GetBankCardEvent extends BankCardEvent {}

class RegisterBankCardEvent extends BankCardEvent {}

class RemoveBankCardEvent extends BankCardEvent {}
