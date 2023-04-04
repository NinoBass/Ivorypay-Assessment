import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/wallet_action.enum.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/controller/portfolio.controller.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/presentation/widgets/empty_portfolio_state.ui.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/presentation/widgets/header.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class PortfolioUi extends GetView<PortfolioController> {
  const PortfolioUi({super.key});

  @override
  PortfolioController get controller => Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PortfolioHeaderUi(),
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    if (controller.wallets.isEmpty)
                      SliverPadding(
                        padding: baseViewPadding.w,
                        sliver: const SliverFillRemaining(
                          hasScrollBody: false,
                          child: EmptyPortfolioStateUi(),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: baseViewPadding.w,
                        sliver: SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Gap(32),
                              const TextUi.body1(
                                'All wallets',
                                fontWeight: mediumText,
                              ),
                              const Gap(16),
                              ...controller.wallets.map((wallet) {
                                return WalletTileUi(
                                  wallet: wallet,
                                  action: WalletAction.viewDetails,
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
