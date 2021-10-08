// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
// Source : https://github.com/flutter/udacity-course/blob/master/course/02_category_widget
import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';
import 'package:unit_converter/converter_route.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({
    Key? key,
    required this.name,
    required this.color,
    required this.iconLocation,
    required this.units,
  }) : super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context){
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                name,
                style: Theme.of(context).textTheme.headline4
              ),
              centerTitle: true,
              backgroundColor: color,
            ),
            body: ConverterRoute(
              color: color,
              units: units
            ),
          );
        }));
  }
  @override
  Widget build(BuildContext context) {
    return
      Material(
        color: Colors.transparent,
        child: SizedBox(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: color,
            splashColor: color,
            onTap: () => _navigateToConverter(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        iconLocation,
                        size: 60.0,
                      )
                  ),
                  Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      )
                  ),
                ],
              ),
            ),
        ),
    ),
      );
  }
}