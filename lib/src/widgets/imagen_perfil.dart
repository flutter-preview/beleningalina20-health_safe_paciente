import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';
import 'package:health_safe_paciente/src/helpers/size_config.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class ImagenPerfil extends StatefulWidget {
  File? imagenPerfil;
  final bool cambiarImagenPerfil;

  ImagenPerfil({
    super.key,
    this.imagenPerfil,
    this.cambiarImagenPerfil = false,
  });

  @override
  State<ImagenPerfil> createState() => _ImagenPerfilState();
}

class _ImagenPerfilState extends State<ImagenPerfil> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: <Widget>[
      CircleAvatar(
        backgroundColor: ColorsApp.celesteFondo,
        radius: SizeConfig.height * 0.11,
        child: (widget.imagenPerfil != null)
            ? CircleAvatar(
                backgroundImage: FileImage(widget.imagenPerfil!),
                radius: SizeConfig.height * 0.1)
            : CircleAvatar(
                backgroundImage: const AssetImage('assets/imgs/no-person.png'),
                radius: SizeConfig.height * 0.1),
      ),
      if (widget.cambiarImagenPerfil)
        Positioned(
            top: SizeConfig.height * 0.15,
            left: SizeConfig.height * 0.15,
            child: CircleAvatar(
                backgroundColor: ColorsApp.azulBusqueda,
                radius: SizeConfig.height * 0.035,
                child: IconButton(
                    onPressed: seleccionImagenPerfil,
                    icon: const Icon(Icons.camera_alt, color: Colors.white))))
    ]);
  }

  void seleccionImagenPerfil() {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (BuildContext context) {
          return AlertDialogCustom(content: [
            const Text("Seleccione su foto de perfil"),
            const Divider(),
            TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  widget.imagenPerfil = await pickImage(ImageSource.camera);
                  setState(() {});
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Abrir cámara")),
            const Divider(),
            TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  widget.imagenPerfil = await pickImage(ImageSource.gallery);
                  setState(() {});
                },
                icon: const Icon(Icons.image),
                label: const Text("Abrir galería de fotos"))
          ]);
        });
  }

  Future<File?> pickImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    var imagen = await imagePicker.pickImage(source: source);
    return (imagen != null) ? File(imagen.path) : null;
  }
}
