import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lms_apps/Services/transaction_history_service.dart';

class TransactionHistoryBody extends StatelessWidget {
  const TransactionHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TransactionHistoryService().getUserCourse(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data?.data?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var transactionHistory = snapshot.data?.data;
              return Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 15),
                child: Container(
                  width: double.infinity,
                  height: 140,
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
                        Text('${transactionHistory?[index].data?.courseId}'),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff198754),
                          ),
                          child: const Text(
                            'Pembayaran Berhasil',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Paid on : ${transactionHistory?[index].createdAt}'),
                            Text(
                              CurrencyFormat.convertToIdr(
                                transactionHistory?[index].course?.price,
                                0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                            'Payment Method : ${transactionHistory?[index].data?.paymentMethod}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: Text('Kamu belum membeli kursus!'));
      },
    );
  }
}

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp.',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
