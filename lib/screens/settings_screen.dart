import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    Key? key,
    required this.onSettingsChanged,
    required this.settings,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subTitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem glutten',
                'Só exibe refeições sem glutten',
                settings.isGluttenFree,
                (value) => setState(() => settings.isGluttenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'Só exibe refeições sem veganas',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                'Vegetariana',
                'Só exibe refeições sem vegetarianas',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              )
            ],
          ))
        ],
      ),
    );
  }
}
