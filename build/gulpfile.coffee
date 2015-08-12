gulp = require 'gulp'
parameters = require '../config/parameters.coffee'
browserSync = require 'browser-sync'
reload = browserSync.reload
gutil = require 'gulp-util'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
uglify = require 'gulp-uglify'

gulp.task 'coffee', ->
  gulp.src parameters.app_path+'/**/*.coffee'
  .pipe coffee bare: true
  .pipe concat parameters.app_main_file
  .pipe gulp.dest parameters.web_path+'/js'
  .on 'error', gutil.log

gulp.task 'jade', ->
  gulp.src parameters.app_path + '/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest parameters.web_path
  .on 'error', gutil.log

gulp.task 'sass', ->
  gulp.src parameters.styles_main_file
  .pipe sass()
  .pipe gulp.dest parameters.web_path+'/css'
  .on 'error', gutil.log

gulp.task 'minify', ['coffee'], ->
  gulp.src parameters.web_path+'/js/**.js'
  .pipe uglify outSourceMap: true
  .pipe gulp.dest parameters.web_path+'/js'
  .on 'error', gutil.log

gulp.task 'assets', ->
  gulp.src parameters.assets_path + '/**'
  .pipe gulp.dest parameters.web_path
  .on 'error', gutil.log

gulp.task 'build',['coffee', 'jade', 'sass', 'assets']

gulp.task 'server', ['build'], ->
  browserSync 
    port: 9000
    server: 
      baseDir: parameters.web_path

gulp.task 'watch', ->
  gulp.watch parameters.app_path + '/**/*.coffee', ['coffee']
  gulp.watch parameters.app_path + '/**/*.scss', ['sass']
  gulp.watch parameters.app_path + '/**/*.jade', ['jade']
  gulp.watch parameters.assets_path, ['assets']
  gulp.watch parameters.web_path + '/**/*'
  .on 'change', reload

gulp.task 'default', ['server', 'watch']


