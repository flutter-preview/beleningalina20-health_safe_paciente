import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class ImagenDni extends StatefulWidget {
  File? imagenDni;
  String tipoImagenDni; // frente o dorso
  final bool cambiarImagenDni;

  ImagenDni({
    super.key,
    required this.tipoImagenDni,
    this.imagenDni,
    this.cambiarImagenDni = false,
  });

  @override
  State<ImagenDni> createState() => _ImagenDniState();
}

class _ImagenDniState extends State<ImagenDni> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.all(SizeConfig.height * 0.005),
            padding: EdgeInsets.all(SizeConfig.height * 0.01),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.height * 0.005),
                child: (widget.imagenDni != null)
                    ? Image(
                        image: FileImage(widget.imagenDni!), fit: BoxFit.cover)
                    : Image(
                        image: AssetImage((widget.tipoImagenDni == 'frente')
                            ? 'assets/imgs/dni_frente.png'
                            : 'assets/imgs/dni_dorso.png'),
                        fit: BoxFit.cover))),
        if (widget.cambiarImagenDni)
          Positioned(
              top: SizeConfig.height * 0.2,
              left: SizeConfig.height * 0.33,
              child: CircleAvatar(
                  backgroundColor: ColorsApp.azulBusqueda,
                  radius: SizeConfig.height * 0.03,
                  child: IconButton(
                      onPressed: seleccionImagenPerfil,
                      icon: const Icon(Icons.camera_alt, color: Colors.white))))
      ],
    );
    /*return Stack(clipBehavior: Clip.none, children: <Widget>[
      CircleAvatar(
        backgroundColor: ColorsApp.celesteFondo,
        radius: SizeConfig.height * 0.08,
        child: (widget.imagenDni != null)
            ? CircleAvatar(
                backgroundImage: FileImage(widget.imagenDni!),
                radius: SizeConfig.height * 0.075)
            : CircleAvatar(
                backgroundImage: const AssetImage('assets/imgs/no-person.png'),
                radius: SizeConfig.height * 0.075),
      ),
      if (widget.cambiarImagenDni)
        Positioned(
            top: SizeConfig.height * 0.1,
            left: SizeConfig.height * 0.1,
            child: CircleAvatar(
                backgroundColor: ColorsApp.azulBusqueda,
                radius: SizeConfig.height * 0.03,
                child: IconButton(
                    onPressed: seleccionImagenPerfil,
                    icon: const Icon(Icons.camera_alt, color: Colors.white))))
    ]);*/
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
                  widget.imagenDni = await pickImage(ImageSource.camera);
                  setState(() {});
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("Abrir cámara")),
            const Divider(),
            TextButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  widget.imagenDni = await pickImage(ImageSource.gallery);
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
