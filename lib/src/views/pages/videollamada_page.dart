import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class VideollamadaPage extends StatefulWidget {
  static const String routeName = "VideollamadaPage";

  const VideollamadaPage({super.key});

  @override
  State<VideollamadaPage> createState() => _VideollamadaPageState();
}

class _VideollamadaPageState extends State<VideollamadaPage> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  late TurnoPacienteDto turno;

  @override
  Widget build(BuildContext context) {
    turno = ModalRoute.of(context)?.settings.arguments as TurnoPacienteDto;
    return Scaffold(
      drawer: const DrawerCustom(),
      appBar: const AppbarCustom(),
      backgroundColor: ColorsApp.azulLogin,
      body: Padding(
        padding: EdgeInsets.all(Dimens.dimens20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  BodyText(
                    text:
                        "SALA DE ESPERA \nTurno con ${turno.profesional.toString()}",
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Dimens.dimens20),
                  DescriptionText(
                    textAlign: TextAlign.center,
                    text:
                        "Horario del turno: Hoy - ${turno.horaInicio.convertToString()}",
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimens.dimens20),
                    child: InfoProfesionalCard(profesional: turno.profesional),
                  ),
                  TextButtonCustom(
                      text:
                          "Unirse a la videollamada con el ${turno.profesional.toString()}",
                      onPressed: () => _joinMeeting()),
                  if (loading) const Loader(),
                ],
              ),
              Column(children: [
                const DescriptionText(
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    text:
                        "La videollamada se realizará a través de Jitsi Meet"),
                SizedBox(height: Dimens.dimens10),
                Image(
                    image: const AssetImage('assets/imgs/jitsi_meet.png'),
                    height: Dimens.dimens50),
              ])
            ]),
      ),
    );
  }

  _joinMeeting() async {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);

    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.CALENDAR_ENABLED: false,
      FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: false,
      FeatureFlagEnum.CHAT_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
      FeatureFlagEnum.RAISE_HAND_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.CALL_INTEGRATION_ENABLED: false,
    };

    var options = JitsiMeetingOptions(
        room:
            "turno_${turno.id}_${autenticacionService.paciente?.usuario.dni}_hsA")
      ..subject =
          "${autenticacionService.paciente?.usuario.toString()} - ${turno.profesional.toString()}"
      ..userDisplayName = autenticacionService.paciente?.usuario.toString()
      ..userEmail = autenticacionService.paciente?.usuario.correo
      ..userAvatarURL = autenticacionService.paciente?.usuario.urlImagenPerfil
      ..featureFlags.addAll(featureFlags);

    debugPrint(options.serverURL);

    try {
      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(
            onConferenceWillJoin: _onConferenceWillJoin,
            onConferenceJoined: _onConferenceJoined,
            onConferenceTerminated: _onConferenceTerminated,
            onError: _onError,
            genericListeners: [
              JitsiGenericListener(
                  eventName: 'readyToClose',
                  callback: (dynamic message) {
                    debugPrint("readyToClose callback");
                  }),
            ]),
      );
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          context: context,
          builder: (context) => AlertDialogBackground(content: [
                const DescriptionText(
                    text: "No se pudo ingresar a la videollamada"),
                SizedBox(height: Dimens.dimens20),
                const FailureIcon()
              ]));
    }
  }

  void _onConferenceWillJoin(message) {
    setState(() => loading = true);
  }

  void _onConferenceJoined(message) {
    setState(() => loading = false);
  }

  void _onConferenceTerminated(message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialogBackground(
                onAccept: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(HomePage.routeName));
                  Navigator.pushNamed(
                      context, CalificacionProfesionalPage.routeName,
                      arguments: turno.profesional);
                },
                content: [
                  const DescriptionText(text: "El turno finalizó"),
                  SizedBox(height: Dimens.dimens20),
                  const SuccessIcon()
                ]));
  }

  _onError(error) {
    debugPrint(error.toString());
    showDialog(
        context: context,
        builder: (context) => AlertDialogBackground(content: [
              const DescriptionText(text: "Algo salió mal"),
              SizedBox(height: Dimens.dimens20),
              const FailureIcon()
            ]));
  }
}
