import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/bloc/bank_card_bloc.dart';
import 'package:new_project/model/bank_card.dart';
import 'package:http/http.dart' as http;

class BankCardRepository {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> getBankCardEvent(
      GetBankCardEvent event, Emitter<BankCardState> emit) async {
    emit(LoadingBankCardState());
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      final List<dynamic> jsonList = jsonDecode(response.body);
      final getBankCard =
          jsonList.map((json) => BankCard.fromJson(json)).toList();
      emit(FetchedBankCardState(getBankCard));
    } catch (_) {
      emit(FailureBankCardState());
    }
  }

  Future<void> registerBankCardEvent(
      BankCardEvent event, Emitter<BankCardState> emit) async {}

  Future<void> removeBankCardEvent(
      BankCardEvent event, Emitter<BankCardState> emit) async {}
}
