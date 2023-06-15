import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/services/api/api_services.dart';
import 'package:health_safe_paciente/src/services/api/chat_api_service.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = "ChatPage";
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Profesional profesional =
        ModalRoute.of(context)?.settings.arguments as Profesional;

    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(habilitarNavegacionChat: false),
        backgroundColor: ColorsApp.azulLogin,
        body: Column(children: [
          HeaderPage(title: "Mensajería - ${profesional.toString()}"),
          Expanded(child: _Chat(profesional: profesional))
        ]),
        drawer: const DrawerCustom(),
      ),
    );
  }
}

class _Chat extends StatefulWidget {
  final Profesional profesional;
  const _Chat({required this.profesional});

  @override
  State<_Chat> createState() => _ChatState();
}

class _ChatState extends State<_Chat> with TickerProviderStateMixin {
  final mensajeController = TextEditingController();

  List<MensajeChat> mensajes = [];

  bool estaEscribiendo = false;

  final focusNode = FocusNode();

  @override
  void initState() {
    _cargarHistorial();
    super.initState();
  }

  void _cargarHistorial() async {
    List<Mensaje> chat = await ChatApiService()
        .obtenerMensajes(widget.profesional.id, 0, mensajes.length);
    final history = chat.map((mensaje) => MensajeChat(
          mensaje: mensaje,
          animationController: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 0))
            ..forward(),
        ));

    setState(() => mensajes.insertAll(0, history));
  }

  @override
  Widget build(BuildContext context) {
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return Text(
        "Chat - profesional: ${widget.profesional.id} - ${autenticacionService.usuario!.id}");
  }
}

/*
class _ChatPageState extends State<ChatPage>  {

  late ChatService chatService;
  late AutenticacionService autenticacionService;

  late Usuario usuario;

  @override
  void initState() {
    super.initState();

    // chatService = Provider.of<ChatService>(context, listen: false);
    // socketService = Provider.of<SocketService>(context, listen: false);
    autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);

    usuario = ModalRoute.of(context)?.settings.arguments as Usuario;

    // socketService.socket.on('mensaje-personal', _escucharMensaje);

    
  }

  

  void _escucharMensaje(dynamic payload) {
    MensajeChat message = MensajeChat(
        mensaje: Mensaje(
            texto: payload['mensaje'],
            idUsuario: payload['de'],
            fechaHora: payload['fechaHora']),
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300)));

    setState(() => mensajes.insert(0, message));

    message.animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    socketService.dispose();
    mensajeController.dispose();
    for (MensajeChat mensaje in mensajes) {
      mensaje.animationController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCustom(habilitarNavegacionChat: false),
      backgroundColor: ColorsApp.azulLogin,
      body: Column(
        children: [
          HeaderPage(
              title: "Mensajería - ${usuario.nombre} ${usuario.apellido}"),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              onRefresh: _cargarHistorial,
              header: const MaterialClassicHeader(color: Colors.blue),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: mensajes.length,
                  reverse: true,
                  itemBuilder: (_, int i) => mensajes[i]),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimens.dimens20),
            color: Colors.white,
            child: TextField(
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences,
              controller: mensajeController,
              onSubmitted: _enviarMensaje,
              onChanged: (String texto) {
                setState(() {
                  if (texto.trim().isNotEmpty) estaEscribiendo = true;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[100]!, width: 1),
                      borderRadius: BorderRadius.circular(Dimens.dimens10)),
                  contentPadding: EdgeInsets.all(Dimens.dimens20),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Ingrese aquí su mensaje",
                  suffixIcon: IconTheme(
                    data: const IconThemeData(
                      color: Colors.blue,
                    ),
                    child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(Icons.send, color: Colors.blue),
                        onPressed: (estaEscribiendo)
                            ? () =>
                                _enviarMensaje(mensajeController.text.trim())
                            : null),
                  )),
            ),
          )
        ],
      ),
      drawer: const DrawerCustom(),
    ));
  }

  void _enviarMensaje(String texto) {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);
    final usuario = autenticacionService.usuario;
    if (texto.isEmpty) return;
    mensajeController.clear();
    focusNode.requestFocus();

    final nuevoMensaje = Mensaje(
        idUsuario: usuario!.id, texto: texto, fechaHora: DateTime.now());

    final nuevoChatMessage = MensajeChat(
        mensaje: nuevoMensaje,
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 200)));

    mensajes.insert(0, nuevoChatMessage);

    nuevoChatMessage.animationController.forward();

    setState(() => estaEscribiendo = false);
  }
}
*/