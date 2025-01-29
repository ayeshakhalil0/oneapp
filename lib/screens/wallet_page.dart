import 'package:flutter/material.dart';
import 'package:oneapp/shared/widgets/button.dart';
import 'package:oneapp/shared/widgets/circular_gradient_icon_background.dart';
import 'package:oneapp/shared/widgets/donut_chart.dart';
import 'package:oneapp/shared/widgets/earning_metric_card.dart';
import '../shared/widgets/common_background.dart';
import '../app/theme.dart';
import '../shared/widgets/transactions.dart';
import '../core/config/transactions.config.dart';
import '../shared/widgets/wallet_menu.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BackgroundScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 12, 10, 10),
            child: Row(
              children: [
                const Spacer(), // Push the title to the center
                const Text(
                  'My Wallet',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightGray,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                    WalletMenu.show(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            AppColors.profileCommonWidgetColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const GradientCircleIcon(
                        icon: Icon(Icons.menu, color: Colors.white, size: 30),
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDonutChart(
                data: [
                  DonutChartData(
                    name: 'Telegram',
                    percentage: 16,
                    gradientColors: const [
                      Color(0xFF4CAF50),
                      Color(0xFF8BC34A),
                    ],
                  ),
                  DonutChartData(
                    name: 'Course',
                    percentage: 16,
                    gradientColors: const [
                      Color(0xFF2196F3),
                      Color(0xFF03A9F4),
                    ],
                  ),
                  DonutChartData(
                    name: 'Paying Up',
                    percentage: 23,
                    gradientColors: const [
                      Color(0xFF00BCD4),
                      Color(0xFF80DEEA),
                    ],
                  ),
                  DonutChartData(
                    name: 'Plugin',
                    percentage: 25,
                    gradientColors: const [
                      Color(0xFF3F51B5),
                      Color(0xFF7986CB),
                    ],
                  ),
                  DonutChartData(
                    name: 'Webinar',
                    percentage: 20,
                    gradientColors: const [
                      Color(0xFF9C27B0),
                      Color(0xFFBA68C8),
                    ],
                  ),
                ],
                size: screenWidth * 0.48,
                thickness: 30,
              ),
              SizedBox(
                width: screenWidth * 0.25,
                child: CustomButton(
                  label: 'Withdraw',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const EarningsPanel(
            totalEarning: 67839,
            totalWithdraw: 67839,
            amountInPurse: 67839,
          ),
          const SizedBox(height: 10),
          TransactionListWidget(
            transactions: transactions,
            withdrawals: withdrawals,
          ),
        ],
      ),
    );
  }
}
