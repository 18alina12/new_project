import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/model/bank_card.dart';
import 'package:new_project/recourses/bank_card_repository.dart';

part 'bank_card_event.dart';
part 'bank_card_state.dart';

class BankCardBloc extends Bloc<BankCardEvent, BankCardState> {
  final _repository = BankCardRepository();
  BankCardBloc() : super(BankCardInitial()) {
    on<GetBankCardEvent>(_repository.getBankCardEvent);
  }
}
