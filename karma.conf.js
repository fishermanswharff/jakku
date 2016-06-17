// Karma configuration
// Generated on Sun Aug 16 2015 15:09:12 GMT-0400 (EDT)

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['browserify','jasmine'],
    files: [
      'lib/**/*.js',
      'spec/**/*.js'
    ],
    plugins: [
      'karma-browserify',
      'karma-jasmine',
      'karma-chrome-launcher'
    ],
    exclude: [],
    preprocessors: {
      'lib/**/*.js': ['browserify'],
      'spec/**/*.js': ['browserify']
    },
    browserify: {
      debug: true,
      transform: ['babelify'],
    },
    // you can define custom flags
    customLaunchers: {
      Chrome_Harmony: {
        base: 'ChromeCanary',
        flags: ['--enable-javascript-harmony']
      }
    },
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['Chrome_Harmony'],
    singleRun: false
  })
}
