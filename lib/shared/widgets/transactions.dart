import 'package:flutter/material.dart';
import '../../app/theme.dart';

class Transaction {
  final String title;
  final String date;
  final double amount;
  final String imageUrl;
  final bool isWithdraw;

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.imageUrl,
    this.isWithdraw = false,
  });
}

class TransactionListWidget extends StatefulWidget {
  final List<Transaction> transactions;
  final List<Transaction> withdrawals;

  const TransactionListWidget({
    Key? key,
    required this.transactions,
    required this.withdrawals,
  }) : super(key: key);

  @override
  State<TransactionListWidget> createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  bool showTransactions = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Segmented Control
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.walletPageTransactionBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => showTransactions = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: showTransactions
                                ? AppColors.withdrawTransactionTabColor
                                : AppColors.backgroundColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'All Transactions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => showTransactions = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: !showTransactions
                                ? AppColors.withdrawTransactionTabColor
                                : AppColors.backgroundColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'All Withdraw',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Section Title
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      showTransactions ? 'All Transactions' : 'Recent Withdraw',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),

              // Transaction List
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: showTransactions
                    ? widget.transactions.length
                    : widget.withdrawals.length,
                itemBuilder: (context, index) {
                  final item = showTransactions
                      ? widget.transactions[index]
                      : widget.withdrawals[index];
                  return TransactionItem(transaction: item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: AppColors.lineGray,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(
              transaction.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.date,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Amount
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.lineGray,
                width: 1,
              ),
            ),
            child: Text(
              '${transaction.amount > 0 ? "+" : "-"}\$${transaction.amount.abs().toStringAsFixed(2)}',
              style: TextStyle(
                color: transaction.amount > 0
                    ? AppColors.totalWithdrawlColor
                    : AppColors.amountInPurseColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
