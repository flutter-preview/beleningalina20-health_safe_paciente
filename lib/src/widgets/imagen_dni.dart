import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class ImagenDni extends StatelessWidget {
  File? imagenDni;
  String tipoImagenDni; // frente o dorso
  final bool cambiarImagenDni;
  final void Function(File)? onChanged;

  ImagenDni(
      {super.key,
      required this.tipoImagenDni,
      this.imagenDni,
      this.cambiarImagenDni = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.all(SizeConfig.height * 0.005),
            padding: EdgeInsets.all(SizeConfig.height * 0.01),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.height * 0.005),
                child: (imagenDni != null)
                    ? Image(image: FileImage(imagenDni!), fit: BoxFit.cover)
                    : Image(
                        image: AssetImage((tipoImagenDni == 'frente')
                            ? 'assets/imgs/dni_frente.png'
                            : 'assets/imgs/dni_dorso.png'),
                        fit: BoxFit.cover))),
        if (cambiarImagenDni)
          Positioned(
              top: SizeConfig.height * 0.2,
              left: SizeConfig.height * 0.33,
              child: CircleAvatar(
                  backgroundColor: ColorsApp.azulBusqueda,
                  radius: SizeConfig.height * 0.03,
                  child: IconButton(
                      onPressed: () => seleccionImagenPerfil(context),
                      icon: const Icon(Icons.camera_alt, color: Colors.white))))
      ],
    );
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
