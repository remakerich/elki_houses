String reviewCountFormatted(int count) {
  if (count == 1) {
    return '($count отзыв)';
  }
  if ([2, 3, 4].contains(count)) {
    return '($count отзыва)';
  }
  return '($count отзывов)';
}
