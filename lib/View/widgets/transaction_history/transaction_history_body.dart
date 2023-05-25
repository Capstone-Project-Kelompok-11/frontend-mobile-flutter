import 'package:flutter/material.dart';

class TransactionHistoryBody extends StatelessWidget {
  const TransactionHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
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
                  const Text('20230327-XD-12020000000847'),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bulan Maret'),
                      Text('Rp.300.000'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Metode Pembayaran : Transfer'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
