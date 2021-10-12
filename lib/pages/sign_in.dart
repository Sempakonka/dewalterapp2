import 'package:de_walter_app_2/globals.dart';
import 'package:de_walter_app_2/pages/navigation.dart';
import 'package:de_walter_app_2/providers/uiproviders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
/*
class SignInPage extends HookConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AnimatedWidget();
  }
}
*/

class SignInPage extends HookConsumerWidget {
  final Duration duration = const Duration(milliseconds: 400);

  const SignInPage({Key? key}) : super(key: key);
  static double endPoint = 500;
  static double lowerBound = 350;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useAnimationController(
        duration: duration, upperBound: endPoint, lowerBound: lowerBound);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(navigationNotifierProvider).selectPage(1);
      }
    });

    final _height = ref.watch(workspaceNotifierProvider).workSpaceHeight;
    useValueChanged(_height, (_, __) async {
      _controller.forward();
    });
    print(_controller.value);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: _controller.value,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 22, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Welkom",
                      style: Theme.of(context).textTheme.headline1,
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                      "sed do eiusmod tempor incididunt ut labore et dolore "
                      "magna aliqua. Ut enim ad minim veniam, quis nostrud "
                      "exercitation ullamco laboris nisi ut",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText2!.fontSize,
                          color: Colors.black87),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => ref
                              .read(workspaceNotifierProvider)
                              .setHeight(context),
                          child: Row(
                            children: [
                              Text(
                                "Scanner",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .fontSize),
                              ),
                              const Icon(Icons.arrow_forward_rounded)
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: green,
                              //background color of button
                              //elevation of button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.all(
                                  10) //content padding inside button
                              ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(workspaceNotifierProvider)
                            .setHeight(context),
                        child: Row(
                          children: [
                            Text(
                              "Propper",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: green,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            //background color of button
                            //elevation of button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(color: green, width: 2)),
                            padding: const EdgeInsets.all(
                                10) //content padding inside button
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
