import 'dart:io' as Io;
import 'dart:math';
import '../lib/labyrinth.dart';
import 'package:image/image.dart';

void main(List<String> arguments) {
  Grid bt = BinaryTree.start(new Grid(12, 12));
  Grid sw = Sidewinder.start(new Grid(12, 12));
  Ascii ascii = new Ascii();
  Png png = new Png(cellSize: 100);



//  Io.stdout.write('Binary Tree\n');
//  Io.stdout.write('${ascii.render(bt)}\n');
  Io.stdout.write('Sidewinder\n');
  Io.stdout.write('${ascii.render(sw)}\n');

//  new Io.File('../binarytree.png')
//    ..writeAsBytesSync(encodePng(png.render(bt)));
  new Io.File('../sidewinder.png')
    ..writeAsBytesSync(encodePng(png.render(sw)));
}