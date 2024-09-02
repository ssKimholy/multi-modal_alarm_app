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

class AlarmPageScreen extends StatelessWidget {
  const AlarmPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Volarm',
        marginVar: 48.0,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Column(
        children: [
          const IntroductionOfPage(
            introTitle: '알람 목록',
            introSubTitle: '알람 시간을 클릭하여 음성을 들어보세요.',
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: HttpRequestUtil.fetchAllReceivedAlarms(global.getUserId),
              builder: (context, snapshot) {
                print(snapshot);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('error ${snapshot.error}');
                  return const Center(child: Text('데이터를 불러오는 데 실패했습니다.'));
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  // Alarm 객체 리스트를 생성
                  final alarms = data
                      .map((e) => Alarm(
                          alarmName: e["alarmName"],
                          alarmPeriod: e["days"].replaceAll(' ', '').split(','),
                          alarmId: e["alarmId"],
                          alarmTime: e["time"],
                          isNew: false,
                          settingTime: DateTimeUtils.formatCurrentTime(),
                          isActive: e["active"],
                          profile: Profile(e["senderName"], "")))
                      .toList();

                  // 'alarmTime' 기준으로 리스트 정렬
                  alarms.sort((a, b) => a.alarmTime.compareTo(b.alarmTime));

                  return ListView.builder(
                    itemCount: alarms.length,
                    itemBuilder: (context, index) {
                      return AlarmCard(
                        alarm: alarms[index],
                      );
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
