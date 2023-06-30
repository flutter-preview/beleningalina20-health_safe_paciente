import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class CuentaDatosUsuarioPage extends StatelessWidget {
  // TODO Falta la integracion. Definir como se manejaria
  static const String routeName = "CuentaDatosUsuarioPage";
  const CuentaDatosUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        drawer: const DrawerCustom(),
        backgroundColor: ColorsApp.celesteFondo,
        body: Column(
          children: [
            HeaderPage(
                title: "Datos de usuario",
                sufixIcon: IconButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AlertDialogBackground(
                              alignment: Alignment.centerLeft,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              content: [
                                DescriptionText(
                                    text:
                                        "Modifique los datos que desea y luego presione el botón guardar"),
                              ],
                            )),
                    icon: const Icon(Icons.help, color: Colors.white))),
            ChangeNotifierProvider(
                create: (context) => DatosUsuarioFormProvider(),
                child: const _DatosUsuarioForm()),
            ElevatedButtonCustom(
                margin: EdgeInsets.all(Dimens.dimens20),
                text: "Finalizar",
                onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}

class _DatosUsuarioForm extends StatelessWidget {
  const _DatosUsuarioForm();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimens.dimens10)),
          width: double.infinity,
          margin: EdgeInsets.all(Dimens.dimens20),
          padding: EdgeInsets.all(Dimens.dimens20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _CorreoUsuario(),
                SizedBox(height: Dimens.dimens20),
                const _ContrasenaUsuario(),
                SizedBox(height: Dimens.dimens20),
                const _ImagenPerfilUsuario()
              ],
            ),
          )),
    );
  }
}

class _CorreoUsuario extends StatelessWidget {
  const _CorreoUsuario();

  @override
  Widget build(BuildContext context) {
    final autenticacionService = Provider.of<AutenticacionService>(context);
    final datosUsuarioFormProvider =
        Provider.of<DatosUsuarioFormProvider>(context);

    return Form(
      key: datosUsuarioFormProvider.correoKey,
      child: (!datosUsuarioFormProvider.modificarCorreo)
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const DescriptionText(text: "Correo: "),
              SizedBox(width: Dimens.dimens20),
              Expanded(
                  child: DescriptionText(
                      text:
                          autenticacionService.paciente?.usuario.correo ?? '')),
              IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    datosUsuarioFormProvider.modificarCorreo = true;
                  })
            ])
          : EmailTextFormField(
              borderColor: Colors.black,
              labelColor: Colors.black,
              onChanged: (value) => datosUsuarioFormProvider.correo = value,
              validator: datosUsuarioFormProvider.correoValidator,
              suffixIcon: IconButton(
                  onPressed: () {
                    if (datosUsuarioFormProvider.esValidoCorreo()) {
                      // llamada al servicio para modificar la contrasena
                      if (datosUsuarioFormProvider.correo != '') {
                        autenticacionService.paciente?.usuario.correo =
                            datosUsuarioFormProvider.correo!;
                      }

                      datosUsuarioFormProvider.modificarCorreo = false;
                    }
                  },
                  icon: (datosUsuarioFormProvider.esValidoCorreo())
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.close, color: Colors.red)),
            ),
    );
  }
}

class _ContrasenaUsuario extends StatelessWidget {
  const _ContrasenaUsuario();

  @override
  Widget build(BuildContext context) {
    final autenticacionService = Provider.of<AutenticacionService>(context);
    final datosUsuarioFormProvider =
        Provider.of<DatosUsuarioFormProvider>(context);

    return Form(
      key: datosUsuarioFormProvider.contrasenaKey,
      child: (!datosUsuarioFormProvider.modificarContrasena)
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const DescriptionText(text: "Contraseña: "),
              SizedBox(width: Dimens.dimens20),
              const Expanded(child: DescriptionText(text: '••••••••••••')),
              IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    datosUsuarioFormProvider.modificarContrasena = true;
                  })
            ])
          : ContrasenaTextFormField(
              value: datosUsuarioFormProvider.contrasena ?? '',
              borderColor: Colors.black,
              labelColor: Colors.black,
              onChanged: (value) => datosUsuarioFormProvider.contrasena = value,
              validator: datosUsuarioFormProvider.contrasenaValidator,
              suffixIcon: IconButton(
                  onPressed: () {
                    if (datosUsuarioFormProvider.esValidaContrasena()) {
                      // llamada al servicio para modificar el correo
                      if (datosUsuarioFormProvider.contrasena != '') {
                        autenticacionService.paciente?.usuario.contrasena =
                            datosUsuarioFormProvider.contrasena!;
                      }

                      datosUsuarioFormProvider.modificarContrasena = false;
                    }
                  },
                  icon: (datosUsuarioFormProvider.esValidaContrasena())
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.close, color: Colors.red)),
            ),
    );
  }
}

class _ImagenPerfilUsuario extends StatelessWidget {
  const _ImagenPerfilUsuario();

  @override
  Widget build(BuildContext context) {
    // TODO - servicio para modificar la imagen que me traiga la url
    final autenticacionService = Provider.of<AutenticacionService>(context);
    final datosUsuarioFormProvider =
        Provider.of<DatosUsuarioFormProvider>(context);

    return Center(
      child: Stack(
        children: [
          CircleAvatarImagenPerfil(
            image: (datosUsuarioFormProvider.imagenPerfil == null)
                ? NetworkImage(
                    autenticacionService.paciente?.usuario.urlImagenPerfil ??
                        '')
                : FileImage(datosUsuarioFormProvider.imagenPerfil!)
                    as ImageProvider<Object>?,
            radius: Dimens.dimens100,
          ),
          (!datosUsuarioFormProvider.modificarImagenPerfil)
              ? Positioned(
                  top: SizeConfig.height * 0.17,
                  left: SizeConfig.width * 0.3,
                  child: CircleAvatar(
                      backgroundColor: ColorsApp.azulBusqueda,
                      radius: Dimens.dimens30,
                      child: IconButton(
                          onPressed: () {
                            datosUsuarioFormProvider.modificarImagenPerfil =
                                true;

                            seleccionImagen(
                                context,
                                (value) => datosUsuarioFormProvider
                                    .imagenPerfil = value);
                          },
                          icon: const Icon(Icons.camera_alt,
                              color: Colors.white))))
              : Positioned(
                  top: SizeConfig.height * 0.17,
                  left: SizeConfig.width * 0.1,
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: Dimens.dimens30,
                          child: IconButton(
                              onPressed: () async {
                                String urlImagenPerfil = await Future.delayed(
                                        const Duration(seconds: 1))
                                    .then((value) =>
                                        "https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg");

                                autenticacionService.paciente?.usuario
                                    .urlImagenPerfil = urlImagenPerfil;
                                datosUsuarioFormProvider.modificarImagenPerfil =
                                    false;
                              },
                              icon: const Icon(Icons.check,
                                  color: Colors.white))),
                      SizedBox(width: Dimens.dimens20),
                      CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: Dimens.dimens30,
                          child: IconButton(
                              onPressed: () {
                                datosUsuarioFormProvider.modificarImagenPerfil =
                                    false;
                              },
                              icon: const Icon(Icons.close,
                                  color: Colors.white))),
                    ],
                  ))
        ],
      ),
    );

    /**
     * ImagenPerfil(
        labelColor: Colors.black,
        onChanged: (value) => datosUsuarioFormProvider.imagenPerfil,
        imagenPerfil: datosUsuarioFormProvider.imagenPerfil)
     * 
     */
  }
}
