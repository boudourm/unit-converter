// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
// Source : https://github.com/flutter/udacity-course/blob/master/course/02_category_widget
import 'package:flutter/material.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  const Category({
    Key? key,
    required this.name,
    required this.color,
    required this.iconLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return
      Material(
        color: Colors.transparent,
        child: SizedBox(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: color,
            splashColor: color,
            onTap: () {
              print("I was tapped");
            },
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