import 'dart:io';
import '../lib/labyrinth.dart';

void main(List<String> arguments) {
  Grid grid = new Grid(20, 20);
  grid = BinaryTree.start(grid);

  grid.toAscii();

  stdout.write('Grid\n');
  stdout.write(grid.toAscii());
}


