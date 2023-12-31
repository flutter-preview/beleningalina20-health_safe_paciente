import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class FutureStatesBuilder<T> extends StatelessWidget {
  final Future<dynamic>? future;

  final Widget Function(T)? onSuccess;
  final Widget Function()? onNull;
  final Widget Function(dynamic)? onError;
  final Widget Function()? onEmpty;
  final Widget Function(T?)? someAction;

  const FutureStatesBuilder(
      {super.key,
      required this.future,
      this.onSuccess,
      this.onNull,
      this.onError,
      this.onEmpty,
      this.someAction});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: ((context, snapshot) {
          if (someAction != null) {
            return someAction!(snapshot.data);
          }

          if (snapshot.hasError) {
            if (onError != null) {
              return onError!(snapshot.error);
            } else {
              return const MessageState(
                  text: "Algo salió mal. Inténtalo más tarde.",
                  iconState: FailureIcon());
            }
          }
          if (snapshot.hasData) {
            final data = snapshot.data;
            if (data != null) {
              if (T.toString().contains("List", 0)) {
                if ((data as List).isEmpty) {
                  if (onEmpty != null) {
                    return onEmpty!();
                  } else {
                    return const MessageState(
                        text: "No se encontró información",
                        iconState: EmptyIcon());
                  }
                }
              }
              if (onSuccess != null) {
                return onSuccess!(data);
              } else {
                return const MessageState(
                    text: "Se encontró información", iconState: SuccessIcon());
              }
            } else {
              if (onNull != null) {
                return onNull!();
              } else {
                return const MessageState(
                    text: "Algo salió mal. Inténtalo más tarde.",
                    iconState: FailureIcon());
              }
            }
          }
          return const Loader();
        }));
  }
}

class MessageState extends StatelessWidget {
  final String text;
  final Widget? iconState;
  const MessageState({super.key, required this.text, required this.iconState});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        DescriptionText(text: text),
        SizedBox(height: Dimens.dimens20),
        iconState ?? Container()
      ]),
    );
  }
}
