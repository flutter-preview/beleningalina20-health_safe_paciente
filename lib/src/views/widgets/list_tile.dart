import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class ListTileDrawerOption extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color textColor;

  const ListTileDrawerOption({
    super.key,
    this.onTap,
    required this.title,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /*autofocus: ,*/
      contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.dimens20, vertical: Dimens.dimens10),
      /*dense: ,
      enableFeedback: ,
      enabled: ,
      focusColor: ,
      focusNode: ,
      horizontalTitleGap: ,
      hoverColor: ,
      iconColor: ,
      isThreeLine: ,
      key: ,
      leading: ,
      minLeadingWidth: ,
      minVerticalPadding: ,
      mouseCursor: ,
      onLongPress: ,*/
      onTap: onTap,
      selected: true,
      selectedColor: Colors.blue,
      /*selectedTileColor: ,*/
      // shape: RoundedRectangleBorder(),
      /*style: ,*/
      // subtitle: Text("Subtitle"),
      // textColor: textColor,
      // tileColor: Colors.red,
      title: DescriptionText(text: title, color: textColor),
      /*trailing: ,
      visualDensity: ,*/
    );
  }
}

class ListTileMenuOpcion extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String paginaDestino;
  const ListTileMenuOpcion(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.paginaDestino});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.dimens20),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: GradientIcon(
              icon: Icon(icon, color: Colors.blue, size: Dimens.dimens70)),
          title: DescriptionText(text: title),
          subtitle: SubdescriptionText(text: subtitle, color: Colors.grey),
          onTap: () => Navigator.pushNamed(context, paginaDestino)),
    );
  }
}
