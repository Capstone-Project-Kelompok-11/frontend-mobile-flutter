import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/transaction_history_view_model.dart';
import 'package:provider/provider.dart';

class TransactionHistoryBody extends StatefulWidget {
  const TransactionHistoryBody({super.key});

  @override
  State<TransactionHistoryBody> createState() => _TransactionHistoryBodyState();
}

class _TransactionHistoryBodyState extends State<TransactionHistoryBody> {
  @override
  void initState() {
    final transactionHistoryViewModel =
        Provider.of<TransactionHistoryViewModel>(context, listen: false);
    transactionHistoryViewModel.getTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transactionHistoryViewModel =
        Provider.of<TransactionHistoryViewModel>(context);
    return transactionHistoryViewModel.isLoading
        ? Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.only(top: 10),
            child:
                const Center(child: CircularProgressIndicator(strokeWidth: 1)),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactionHistoryViewModel.transactionHistory.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var transactionHistory =
                  transactionHistoryViewModel.transactionHistory[index];
              return transactionHistory.id != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 15),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 12, bottom: 12, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${transactionHistory.id?.toUpperCase()}'),
                              const SizedBox(height: 5),
                              transactionHistory.paid == true
                                  ? Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: greenColor,
                                      ),
                                      child: const Text(
                                        'Pembayaran Berhasil',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: redColor,
                                      ),
                                      child: const Text(
                                        'Pembayaran Gagal',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Paid on : ${DateFormat('dd MMMM yyyy').format(
                                    DateTime.parse(transactionHistory.createdAt
                                        .toString()),
                                  )}'),
                                  Text(
                                    transactionHistoryViewModel.currencyFormat(
                                      number: transactionHistory.course?.price,
                                      decimalDigit: 0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                  'Course Name : ${transactionHistory.course?.name}'),
                              const SizedBox(height: 20),
                              Text(
                                'Payment Method : ${transactionHistory.paymentMethod}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Center(child: Text('Kamu belum melakukan transaksi'));
            },
          );
  }
}
