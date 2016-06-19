# Q1 OOP basics

[![Build Status][ci-image]][ci-url]

Write a class called Foobar, that helps implement the following requirement:

* For each number between 1 and 100, your code needs to print:
  * `"<number>: foo"` if it’s divisible by 3 - e.g. `"9: foo"`
  * `"<number>: bar"` if it’s divisible by 5 - e.g. `"10: bar"`
  * `"<number>: foobar"` if it’s divisible by both 3 and 5 - e.g. `"15: foobar"`

```bash
# dependencies:
# ruby 2.3
# bundler gem

$ cd question1-foobar
$ bundle install
$ rspec
```

[ci-image]: https://travis-ci.org/fishermanswharff/jakku.svg?branch=master
[ci-url]: https://travis-ci.org/fishermanswharff/jakku
