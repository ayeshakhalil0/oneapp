import 'package:flutter/material.dart';
import '../../app/theme.dart';

class EarningsMetricCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color backgroundColor;

  const EarningsMetricCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          '\$${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class EarningsMetricColumn extends StatelessWidget {
  final String title;
  final double amount;
  final Color backgroundColor;

  const EarningsMetricColumn({
    Key? key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        EarningsMetricCard(
          title: title,
          amount: amount,
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }
}

class EarningsPanel extends StatelessWidget {
  final double totalEarning;
  final double totalWithdraw;
  final double amountInPurse;

  const EarningsPanel({
    Key? key,
    required this.totalEarning,
    required this.totalWithdraw,
    required this.amountInPurse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: AppColors.walletPageTransactionBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EarningsMetricColumn(
            title: 'Total Earning',
            amount: totalEarning,
            backgroundColor: AppColors.totalEarningColor,
          ),
          EarningsMetricColumn(
            title: 'Total Withdraw',
            amount: totalWithdraw,
            backgroundColor: AppColors.totalWithdrawlColor,
          ),
          EarningsMetricColumn(
            title: 'Amount in Purse',
            amount: amountInPurse,
            backgroundColor: AppColors.amountInPurseColor,
          ),
        ],
      ),
    );
  }
}
