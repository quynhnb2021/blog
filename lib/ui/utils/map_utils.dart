import 'dart:convert';
import 'dart:ui';

Offset convertListToOffset(List<double> data) {
  return Offset(data[0], data[1]);
}

List<Offset> convertNestedListToListOffset(List<List<double>> data) {
  List<Offset> offsets = [];
  for (int i = 0; i < data.length; i++) {
    offsets.add(convertListToOffset(data[i]));
  }
  return offsets;
}

List<Offset> convertStringToListOffset(String str) {
  List<Offset> result = [];
  if (str.isNotEmpty) {
    List<dynamic> convert = jsonDecode(str);
    for (final e in convert) {
      final num x = e[0];
      final num y = e[1];
      result.add(Offset(x.toDouble(), y.toDouble()));
    }
    if (result.isNotEmpty) {
      result.add(result[0]);
    }
  }
  return result;
}

String convertListOffsetToString(List<Offset> arr, {double scale = 1.0}) {
  List<List<num>> temp = [];
  for (final e in arr) {
    List<double> offset = [];
    offset.add(e.dx * scale);
    offset.add(e.dy * scale);
    temp.add(offset);
  }
  String result = jsonEncode(temp);
  return result;
}

bool checkInsideArea(Offset offset, List<Offset> vs) {
  var x = offset.dx, y = offset.dy;

  var inside = false;
  for (var i = 0, j = vs.length - 1; i < vs.length; j = i++) {
    var xi = vs[i].dx, yi = vs[i].dy;
    var xj = vs[j].dx, yj = vs[j].dy;

    var intersect =
        ((yi > y) != (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
    if (intersect) inside = !inside;
  }

  return inside;
}

Offset getCenterPolygon(List<Offset> polygon) {
  double dx = 0;
  double dy = 0;

  for (int i = 0; i < polygon.length; i++) {
    dx += polygon[i].dx;
    dy += polygon[i].dy;
  }

  int totalPoints = polygon.length;
  dx = dx / totalPoints;
  dy = dy / totalPoints;

  return Offset(dx, dy);
}
