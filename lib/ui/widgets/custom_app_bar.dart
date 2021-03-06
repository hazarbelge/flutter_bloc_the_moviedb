import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_movie_db_flutter/cubits/index.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar({
    Key? key,
    this.height = 70,
  }) : super(key: key, preferredSize: const Size(414, 70), child: const SizedBox());

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: darkAccentColor,
      title: SizedBox(
        height: height,
        width: 50,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: SvgPicture.asset("assets/icons/app_icon.svg"),
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().themeMode == ThemeMode.dark ? context.read<ThemeCubit>().emit(ThemeState.light) : context.read<ThemeCubit>().emit(ThemeState.dark);
          },
          icon: Icon(context.read<ThemeCubit>().themeMode == ThemeMode.light ? Icons.wb_incandescent : Icons.wb_incandescent_outlined),
        ),
        IconButton(
          onPressed: () {
            Get.updateLocale(Get.locale! == const Locale("tr", "TR") ? const Locale("en", "US") : const Locale("tr", "TR"));
          },
          icon: Text(Get.locale != null ? Get.locale!.languageCode.toUpperCase() : "TR"),
        ),
      ],
    );
  }
}
