import 'package:flutter/material.dart';
import 'package:vgv_coffee_machine/core/localizations/localizations.dart';
import 'package:vgv_coffee_machine/core/ui/core_colors.dart';
import 'package:vgv_coffee_machine/core/ui/core_dimensions.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/cubit_widget.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CoreDimensions.paddingL),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: CoreDimensions.paddingM),
            _ThemeModeChangeButton(),
            const SizedBox(height: CoreDimensions.paddingM),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class _ThemeModeChangeButton
    extends CubitWidget<AppThemeCubit, CustomThemeMode> {
  @override
  Widget build(
      BuildContext context, AppThemeCubit cubit, CustomThemeMode mode, _) {
    final foregroundColor = isLight(mode)
        ? CoreColors.changeThemeButtonForegroundColorLightMode
        : CoreColors.changeThemeButtonForegroundColorDarkMode;

    return ElevatedButton(
      onPressed: () => cubit.changeThemeMode(mode.opposite),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(CoreDimensions.defaultBorderRadius),
          ),
        ),
        padding: const EdgeInsets.all(CoreDimensions.paddingL),
        backgroundColor: isLight(mode)
            ? CoreColors.changeThemeButtonBackgroundColorLightMode
            : CoreColors.changeThemeButtonBackgroundColorDarkMode,
        foregroundColor: foregroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CoreText.body(S.of(context).changeTheme),
          const SizedBox(width: CoreDimensions.paddingS),
          Icon(
            isLight(mode) ? CoreIcons.lightMode : CoreIcons.darkMode,
            color: foregroundColor,
          ),
        ],
      ),
    );
  }

  bool isLight(CustomThemeMode mode) => mode == CustomThemeMode.light;
}
