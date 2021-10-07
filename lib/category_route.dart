// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'package:unit_converter/category.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants
final _backgroundColor = Colors.green[100];
/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
/*
*     'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
* */
  static const _categoryIcons = <IconData>[
    Icons.social_distance_outlined,
    Icons.workspaces_filled,
    Icons.volume_down,
    Icons.line_weight,
    Icons.timelapse,
    Icons.sd_card,
    Icons.power,
    Icons.money,
  ];

  /// For portrait, we construct a [ListView] from the list of category widgets.
  /// For landscape, we construct a [GridView] from the list of category widgets.
  Widget _buildCategoryWidgets(List<Widget> categories, orientation) {
    if(orientation == Orientation.portrait){
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length,
      );
    }else{
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: categories,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    final categories = <Category> [];
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    for (var i=0; i<_categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i] as ColorSwatch<dynamic>,
        iconLocation: _categoryIcons[i],
      ));
    }

    // TODO: Create a list view of the Categories
    final listView = Container(
      color: _backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories, Orientation.portrait),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      elevation: 0.0,
      title: const Text(
        "Unit Converter",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}