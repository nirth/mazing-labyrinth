// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library labyrinth.test;

import 'package:test/test.dart';
import '../lib/labyrinth.dart';

part 'cell_specs.dart';
part 'cell_links_specs.dart';
part 'grid_specs.dart';

main() {
  cellSpecs();
  cellLinksSpecs();
  gridSpecs();
}