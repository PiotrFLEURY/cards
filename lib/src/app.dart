import 'package:cards/src/card_feature/card_item_creation_page.dart';
import 'package:cards/src/card_feature/card_item_details_view.dart';
import 'package:cards/src/card_feature/card_item_list_view.dart';
import 'package:cards/src/card_feature/card_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
    required this.cardService,
  }) : super(key: key);

  final SettingsController settingsController;
  final CardService cardService;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
            primarySwatch: Colors.green,
            backgroundColor: Colors.green[100],
            scaffoldBackgroundColor: Colors.green[100],
            cardColor: Colors.green[200],
          ),
          darkTheme: ThemeData.dark(),

          themeMode: ThemeMode.system, //settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case CardItemCreationPage.routeName:
                    return const CardItemCreationPage();
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case CardItemDetailsView.routeName:
                    return CardItemDetailsView(cardService: cardService);
                  case CardItemListView.routeName:
                  default:
                    return CardItemListView(cardService: cardService);
                }
              },
            );
          },
        );
      },
    );
  }
}
