# Word Search Kata

Here is the word search kata as I have done it so far. If you have a recent
version of Ruby installed, you should have everything you need. There are no gem
dependencies, and hence no Gemfile and no need to run bundler. Even the test
framework used, Minitest, is in the Ruby standard library. The program and tests
run on the command-line.

## To run the tests

The provided Rakefile contains only one task, the task to run the tests, and it
is the default task. So from in the project root directory, simply run:

```
$ rake
```

## To run the word search

The executable ruby script is in the project root directory and is called
`word_search.rb`. It expects the word search, using the format specified by the
[kata](https://github.com/PillarTechnology/kata-word-search), to be input via
STDIN. The example word search from the kata is included as `example.txt` so to
run it with that input:

```
$ ruby word_search.rb < example.txt
```

Happy word searching!
