import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constants/defaults.dart';
import 'package:to_do_app/constants/ghaps.dart';
import 'package:to_do_app/theme/app_colors.dart';
import 'package:to_do_app/theme/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.payload});
  final String payload;

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  late String _payload;

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          _payload.split('|')[0],
          style: Themes().headingStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH20,
            _titleWidget(),
            gapH12,
            _notificationBody(),
            gapH12,
          ],
        ),
      ),
    );
  }

  Expanded _notificationBody() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDefaults.padding24, vertical: AppDefaults.padding16),
      margin: EdgeInsets.symmetric(horizontal: AppDefaults.padding24),
      decoration: BoxDecoration(
        color: AppColors.primaryClr,
        borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(icon: Icons.text_format, text: 'Title'),
          gapH20,
          _bodyText(_payload.split('|')[0]),
          gapH20,
          _sectionTitle(icon: Icons.description, text: 'Description'),
          gapH20,
          _bodyText(_payload.split('|')[1]),
          gapH20,
          _sectionTitle(icon: Icons.calendar_month, text: 'Date'),
          gapH20,
          _bodyText(_payload.split('|')[2]),
        ],
      ),
    ));
  }

  Text _bodyText(String text) {
    return Text(
      text,
      style: Themes().subTitleStyle,
    );
  }

  Row _sectionTitle({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
        ),
        gapW8,
        Text(
          text,
          style: Themes().titleStyle,
        )
      ],
    );
  }

  Column _titleWidget() {
    return Column(
      children: [
        Text(
          'Hello, Ahmed',
          style: Themes().headingStyle,
        ),
        gapH8,
        Text(
          'You have a new reminder',
          style: Themes().body2Style,
        ),
      ],
    );
  }
}
