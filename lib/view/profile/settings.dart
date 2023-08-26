
import 'package:comic_hub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:theme_manager/change_theme_widget.dart';
import 'package:theme_manager/theme_manager.dart';



class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  SettingTemp(),
          );
        }
  }


class SettingTemp extends StatelessWidget {
  const SettingTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Manager'),
        centerTitle: true,
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () =>
                    // ThemeManager.of(context)
                    // .setBrightnessPreference(BrightnessPreference.system),
                ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.system),

                child: const Text('System'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.light),

                  // ThemeManager.of(MyApp() as BuildContext)
                      // .setBrightnessPreference(BrightnessPreference.light),
                  child: const Text('Light'),
                ),
              ),
              ElevatedButton(
                onPressed: () => ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.dark),

                // ThemeManager.of(MyApp() as BuildContext)
                    // .setBrightnessPreference(BrightnessPreference.dark),
                child: const Text('Dark'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}



class SettingMainPage extends StatelessWidget {
  const SettingMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // user card
            SimpleUserCard(
              userName: "CTC",
              userProfilePic: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHFXcvkgaVetaFH-J4M2yOrIUCBCUVRhkMcA&usqp=CAU').image,
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    SettingTemp();
                  },
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title:
                  'Appearance',
                  subtitle:
                  "CTC",
                  titleMaxLine: 1,
                  subtitleMaxLine: 1,
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Dark mode',
                  subtitle: "Automatic",
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (value) {
                      void setAsDark() =>
                          ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.dark);
                      value=!value;
                      // if(value==true)
                      //   {
                      //     void setAsDark() =>
                      //         ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.dark);
                      //   }
                      // else {
                      //   void setAsLight() =>
                      //       ThemeManager.of(context).setBrightnessPreference(BrightnessPreference.light);
                      // }

                      print('Dark mode changed to $value');
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(    //we can use multiple SettingsGroup
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about Ziar'App",
                ),
              ],
            ),
            // You can add a settings title
          ],
        ),
      ),
    );
  }
}
