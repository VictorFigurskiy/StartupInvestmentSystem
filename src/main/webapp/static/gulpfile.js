

var gulp = require('gulp');
var uglifycss = require('gulp-uglifycss');
var rename = require('gulp-rename');
 
gulp.task('css', function () {
  gulp.src('css/bootstrap.css')
    .pipe(uglifycss({
      "maxLineLen": 80,
      "uglyComments": true
    }))
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest('./css/'));
});