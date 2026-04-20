import 'dart:io';
import 'package:image/image.dart';

void main() {
  final inputPath = 'app Logo.png';
  final outputPath = 'app Logo Rounded.png';

  final bytes = File(inputPath).readAsBytesSync();
  var img = decodeImage(bytes);

  if (img == null) {
    print('Failed to decode image');
    return;
  }

  // Find bounding box of non-transparent areas to "zoom" effectively
  int minX = img.width, minY = img.height, maxX = 0, maxY = 0;
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      final pixel = img.getPixel(x, y);
      if (pixel.a > 10) { // If not pure transparent
        if (x < minX) minX = x;
        if (x > maxX) maxX = x;
        if (y < minY) minY = y;
        if (y > maxY) maxY = y;
      }
    }
  }

  // Crop to bounding box
  int bbWidth = maxX - minX;
  int bbHeight = maxY - minY;
  if (bbWidth > 0 && bbHeight > 0) {
    // Add a slight 5% padding around the bounding box
    int padX = (bbWidth * 0.1).toInt();
    int padY = (bbHeight * 0.1).toInt();
    
    int cx = minX - padX;
    int cy = minY - padY;
    int cw = bbWidth + (padX * 2);
    int ch = bbHeight + (padY * 2);

    // Ensure we don't go out of bounds
    cx = cx.clamp(0, img.width);
    cy = cy.clamp(0, img.height);
    if (cx + cw > img.width) cw = img.width - cx;
    if (cy + ch > img.height) ch = img.height - cy;

    // Use copyCrop instead of crop
    img = copyCrop(img, x: cx, y: cy, width: cw, height: ch);
  }

  // Scale to square based on max dimension
  int maxDim = img.width > img.height ? img.width : img.height;
  
  // Create a square transparent canvas
  var squareImg = Image(width: maxDim, height: maxDim);
  // Center the image onto the square canvas
  int dx = (maxDim - img.width) ~/ 2;
  int dy = (maxDim - img.height) ~/ 2;
  compositeImage(squareImg, img, dstX: dx, dstY: dy);
  
  // Make circular mask
  var finalImg = Image(width: maxDim, height: maxDim);
  fillCircle(finalImg, x: maxDim~/2, y: maxDim~/2, radius: maxDim~/2, color: ColorRgba8(255,255,255,255));
  
  // Appply mask using compose
  for (int y = 0; y < maxDim; y++) {
    for (int x = 0; x < maxDim; x++) {
      final maskPixel = finalImg.getPixel(x, y);
      if (maskPixel.r > 0) {
        finalImg.setPixel(x, y, squareImg.getPixel(x, y));
      } else {
        // Transparent
        finalImg.setPixelRgba(x, y, 0, 0, 0, 0);
      }
    }
  }
  
  finalImg = copyResize(finalImg, width: 1024, height: 1024, interpolation: Interpolation.linear);

  File(outputPath).writeAsBytesSync(encodePng(finalImg));
  print('Successfully saved to $outputPath');
}
