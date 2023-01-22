import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';
import 'package:health_safe_paciente/src/helpers/size_config.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class ImagenPerfil extends StatelessWidget {
  File? imagenPerfil;
  final bool cambiarImagenPerfil;
  final void Function(File)? onChanged;

  ImagenPerfil(
      {super.key,
      this.imagenPerfil,
      this.cambiarImagenPerfil = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: <Widget>[
      CircleAvatar(
        backgroundColor: ColorsApp.celesteFondo,
        radius: SizeConfig.height * 0.11,
        child: (imagenPerfil != null)
            ? CircleAvatar(
                backgroundImage: FileImage(imagenPerfil!),
                radius: SizeConfig.height * 0.1)
            : CircleAvatar(
                backgroundImage: const AssetImage('assets/imgs/no-person.png'),
                radius: SizeConfig.height * 0.1),
      ),
      if (cambiarImagenPerfil)
        Positioned(
            top: SizeConfig.height * 0.15,
            left: SizeConfig.height * 0.15,
            child: CircleAvatar(
                backgroundColor: ColorsApp.azulBusqueda,
                radius: SizeConfig.height * 0.035,
                child: IconButton(
                    onPressed: () => seleccionImagenPerfil(context),
                    icon: const Icon(Icons.camera_alt, color: Colors.white))))
    ]);
  }

  void seleccionImagenPerfil(BuildContext context) {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (BuildContext context) {
          return AlertDialogCustom(content: [
            const Text("Seleccione su foto de perfil"),
            const Divider(),
            TextButton.icon(
                onPressed: () async {
                  await pickImage(context, ImageSource.camera);
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Abrir cámara")),
            const Divider(),
            TextButton.icon(
                onPressed: () async {
                  await pickImage(context, ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text("Abrir galería de fotos"))
          ]);
        });
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    Navigator.pop(context);
    ImagePicker imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: source);
    if (onChanged != null && image != null) {
      onChanged!(File(image.path));
    }
  }
}
