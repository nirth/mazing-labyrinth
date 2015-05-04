import 'dart:io';
import 'dart:math';
import '../lib/labyrinth.dart';

void main(List<String> arguments) {
  stdout.write('Binary Tree\n');
  stdout.write(binaryTree(12, 12));
  stdout.write('Sidewinder\n');
  stdout.write(sidewinder(12, 12));
}

String binaryTree(int rows, int columns) {
  return BinaryTree.start(new Grid(rows, columns)).toAscii() + '\n';
}

String sidewinder(int rows, int columns) {
  return Sidewinder.start(new Grid(rows, columns)).toAscii() + '\n';
}


