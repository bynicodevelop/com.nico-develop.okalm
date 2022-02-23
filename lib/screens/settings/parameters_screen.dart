import 'package:com_nico_develop_relax/repositories/settings_repository.dart';
import 'package:flutter/material.dart';

class ParametersScreen extends StatefulWidget {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  const ParametersScreen({
    Key? key,
    // required this.flutterLocalNotificationsPlugin,
  }) : super(key: key);

  @override
  State<ParametersScreen> createState() => _ParametersScreenState();
}

class _ParametersScreenState extends State<ParametersScreen> {
  bool _vibrate = false;
  double _duration = 5.0;

  // List<TimeOfDay> _times = [];

  @override
  void initState() {
    super.initState();

    // SettingsRepository.getReminders().then(
    //   (value) => setState(() => _times = value),
    // );

    SettingsRepository.getIsVibrate().then(
      (value) => setState(() => _vibrate = value),
    );

    SettingsRepository.getDuration().then(
      (value) => setState(() => _duration = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parameters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CheckboxListTile(
                    title: const Text('Vibration'),
                    subtitle: const Text(
                      'Une vibration est jouée à chaque respiration',
                    ),
                    value: _vibrate,
                    onChanged: (bool? value) async {
                      await SettingsRepository.setIsVibrate(value ?? false);

                      setState(() => _vibrate = value ?? false);
                    },
                    secondary: const Padding(
                      padding: EdgeInsets.only(
                        top: 12.0,
                      ),
                      child: Icon(
                        Icons.vibration,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  const Divider(
                    height: 50.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Text("Durée de la scéance"),
                      ),
                      Slider(
                        value: _duration,
                        onChanged: (double value) async {
                          setState(() => _duration = value);

                          await SettingsRepository.setDuration(value);
                        },
                        min: 1.0,
                        max: 30.0,
                        divisions: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_duration.toStringAsFixed(0)} minutes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // const Divider(
                  //   height: 50.0,
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 5.0,
                  //         bottom: 6.0,
                  //       ),
                  //       child: Text("Rappels"),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(
                  //         left: 5.0,
                  //         bottom: 6.0,
                  //       ),
                  //       child: Text(
                  //         "Vous pouvez définir jusqu'à 3 rappels de scéances quotidiennes (vous recevrez une notification)",
                  //         style:
                  //             Theme.of(context).textTheme.bodySmall!.copyWith(
                  //                   fontSize: 14.0,
                  //                   height: 1.3,
                  //                 ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // SliverGrid(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     mainAxisSpacing: 5.0,
            //     crossAxisSpacing: 5.0,
            //   ),
            //   delegate: SliverChildListDelegate(
            //     [
            //       ..._times.map(((e) {
            //         return Card(
            //           child: Stack(
            //             alignment: AlignmentDirectional.center,
            //             children: [
            //               Positioned(
            //                 top: 0.0,
            //                 right: 0.0,
            //                 child: IconButton(
            //                   onPressed: () async {
            //                     await SettingsRepository.removeReminder(
            //                       e.format(context),
            //                     );

            //                     setState(() => _times.remove(e));
            //                   },
            //                   icon: Icon(
            //                     Icons.delete_outline_rounded,
            //                     size: 20.0,
            //                     color: Colors.grey[700],
            //                   ),
            //                 ),
            //               ),
            //               Text(
            //                 e.format(context),
            //               ),
            //             ],
            //           ),
            //         );
            //       })).toList(),
            //       if (_times.length < 3)
            //         Card(
            //           child: InkWell(
            //             onTap: () async {
            //               TimeOfDay? timeOfDay = await _selectTime(context);

            //               if (timeOfDay != null) {
            //                 await SettingsRepository.addReminder(
            //                   timeOfDay.format(context),
            //                   widget.flutterLocalNotificationsPlugin,
            //                 );

            //                 setState(() => _times.add(timeOfDay));
            //               }
            //             },
            //             child: Icon(
            //               Icons.alarm_add_rounded,
            //               color: Colors.grey[600],
            //             ),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Future<TimeOfDay?> _selectTime(BuildContext context) async {
  //   return await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  // }
}
