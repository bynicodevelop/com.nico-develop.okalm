import 'dart:async';

import 'package:com_nico_develop_relax/repositories/settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CalmScreen extends StatefulWidget {
  final double height;

  const CalmScreen({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<CalmScreen> createState() => _CalmScreenState();
}

class _CalmScreenState extends State<CalmScreen> with TickerProviderStateMixin {
  Duration _duration = const Duration(
    minutes: 5,
  );

  late final AnimationController _controller = AnimationController(
    duration: const Duration(
      seconds: 5,
    ),
    vsync: this,
  );

  late final Animation<double> _animation;

  bool _canVibrate = false;
  bool _started = false;
  bool _countdownStarted = false;
  int maxcountdown = 3;
  int countdown = 3;

  Future<void> startCalm() async {
    final int duration = (await SettingsRepository.getDuration()).toInt();

    setState(
      () => _duration = Duration(
        minutes: duration,
      ),
    );

    setState(() => _started = true);

    _controller.forward();

    Future.delayed(
      _duration,
      () => setState(() {
        _started = false;
        _countdownStarted = false;
      }),
    );
  }

  Future<void> startCountdown() async {
    setState(() => countdown = maxcountdown);

    Timer.periodic(
        const Duration(
          seconds: 1,
        ), (Timer timer) async {
      if (countdown > 0) {
        setState(() => countdown--);
      } else {
        timer.cancel();

        await startCalm();
      }
    });
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Vibrate.canVibrate.then((canVibrate) async {
      final bool isVibrate = await SettingsRepository.getIsVibrate();

      setState(() => _canVibrate = (canVibrate && isVibrate));
    });

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.height,
    ).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_canVibrate) {
          Vibrate.vibrate();
        }

        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (_canVibrate) {
          Vibrate.vibrate();
        }

        _controller.forward();

        if (!_started) {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: SystemUiOverlay.values,
          );

          _controller.stop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: (MediaQuery.of(context).size.height -
                  Theme.of(context).textTheme.headline1!.fontSize! -
                  10) /
              2,
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 500,
            ),
            opacity: _countdownStarted && !_started ? 1 : 0,
            child: Text(
              countdown.toString(),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height - 100) / 2,
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 500,
            ),
            opacity: !_countdownStarted && !_started ? 1 : 0,
            child: GestureDetector(
              onTap: () async {
                SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.manual,
                  overlays: [],
                );

                setState(() => _countdownStarted = true);

                await startCountdown();
              },
              child: Icon(
                Icons.play_circle_outlined,
                color: Colors.white.withOpacity(.8),
                size: 100.0,
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              height: _animation.value,
              color: Colors.white.withOpacity(
                .2,
              ),
            );
          },
        )
      ],
    );
  }
}
