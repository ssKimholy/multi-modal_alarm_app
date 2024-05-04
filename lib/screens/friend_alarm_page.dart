import 'package:alarm_app/models/profile.dart';
import 'package:alarm_app/utils/date_time_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/alarm.dart';
import '../utils/http_request_util.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/introduction_of_page.dart';
import '../widgets/alarm_card.dart';
import '../utils/global_var.dart';

class FriendAlarmPage extends StatelessWidget {
  final String id;
  final String name;
  const FriendAlarmPage({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.5,
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                '$name님에게 설정한 알람',
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto_Sans_KR',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Column(
        children: [
          const IntroductionOfPage(
            introTitle: '알람 목록',
            introSubTitle: '알람을 클릭하여 음성을 들어보세요.',
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: HttpRequestUtil.fetchSentAlarms(
                id,
                global.getUserId,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  final alarms = data
                      .map((e) => Alarm(
                          alarmName: e["alarmName"],
                          alarmPeriod: e["days"].replaceAll(' ', '').split(','),
                          alarmId: e["alarmId"],
                          alarmTime: e["time"],
                          isNew: false,
                          settingTime: DateTimeUtils.formatCurrentTime(),
                          isActive: false,
                          profile: Profile(e["senderName"], "")))
                      .toList();

                  alarms.sort((a, b) => a.alarmTime.compareTo(b.alarmTime));

                  return ListView.builder(
                    itemCount: alarms.length,
                    itemBuilder: (context, index) {
                      return AlarmCard(alarm: alarms[index]);
                    },
                  );
                } else {
                  return const Center(child: Text('데이터가 없습니다.'));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
