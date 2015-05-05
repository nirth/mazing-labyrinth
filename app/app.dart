import 'dart:io' as Io;
import 'dart:math';
import '../lib/labyrinth.dart';
import 'package:image/image.dart';

void main(List<String> arguments) {
  Grid bt = BinaryTree.start(new Grid(13, 13));
  Grid sw = Sidewinder.start(new Grid(13, 13));
  Dijkstra dijkstra = new Dijkstra();

//  Distances btd = new Distances(bt.cellAt(0, 0));
  Distances d0x0 = dijkstra.distances(sw.cellAt(0, 0));
  MaxDistance md = d0x0.maxDistance;

  Distances dMax = dijkstra.distances(md.cell);
  Distances path = dMax.pathTo(dMax.maxDistance.cell);

  Ascii ascii = new Ascii(distances: path);
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