import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/bloc/bank_card_bloc.dart';
import 'package:new_project/model/bank_card.dart';

class BankCardPage extends StatefulWidget {
  const BankCardPage({super.key});

  @override
  State<BankCardPage> createState() => _BankCardPageState();
}

class _BankCardPageState extends State<BankCardPage> {
  late BankCardBloc bankCardBloc;
  List<BankCard> bankList = [];

  @override
  void initState() {
    bankCardBloc = BankCardBloc();
    bankCardBloc.add(GetBankCardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bankCardBloc,
        builder: (BuildContext context, state) {
          if (state is LoadingBankCardState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is FetchedBankCardState) {
            bankList = state.bankCard;
            return buildBody();
          }
          return Container();
        },
      ),
    );
  }

  Widget buildBody() {
    List<Widget> children = [];
    for (var item in bankList) {
      children.add(
        Stack(
          children: [
            Text(item.title),
          ],
        ),
      );
    }
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: children,
      ),
    ));
  }
}
