import 'package:arrivo_frond_end_assignment/configure/dimens.dart';
import 'package:arrivo_frond_end_assignment/configure/styles.dart';
import 'package:arrivo_frond_end_assignment/widget/theme_button.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              _buildTitleWidget(),
              Wrap(
                spacing: DimenConfig.size_24,
                children: [1, 2, 3].asMap().entries.map((e) => _buildSubscriptionPackageWidget(isSubscribedPackage: e.key == 1)).toList(),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _buildTitleWidget() {
    return Container(
      padding: EdgeInsets.only(top: DimenConfig.getSize(50), bottom: DimenConfig.getSize(20), left: DimenConfig.getSize(50)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFF171719),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Subscriptions Screen",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPackageWidget({bool isSubscribedPackage = false}) => Container(
        padding: EdgeInsets.symmetric(horizontal: DimenConfig.getSize(24), vertical: DimenConfig.getSize(40)),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              DimenConfig.size_4,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF171719),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Basic Package",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("A simple start for everyone", style: TextStyleConfig.regularTextStyle()),
            const SizedBox(height: 10),
            Text("\$100/month", style: TextStyleConfig.boldTextStyle()),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("- 100 responses a month", style: TextStyleConfig.regularTextStyle()),
                Text("- Unlimited form and surveys", style: TextStyleConfig.regularTextStyle()),
                Text("- Unlimited fields", style: TextStyleConfig.regularTextStyle()),
              ],
            ),
            SizedBox(height: DimenConfig.size_24),
            isSubscribedPackage
                ? ThemeButton(
                    text: "Your Current Plan",
                    color: Colors.lightGreen,
                    onPressed: () {},
                  )
                : ThemeButton(
                    text: "Subscribe",
                    onPressed: () {},
                  ),
          ],
        ),
      );
}
