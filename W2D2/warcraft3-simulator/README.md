Warcraft III Barracks Simulator
===============

## Premise

Warcraft III is a famous strategy video game by Blizzard. In this game, players can build barracks and then use them to train footmen which they can later use to fight other players' units.

We're going to use OOP to model out Warcraft III's unit training for the Human Race. You'll be reading RSpec examples to determine what functionality needs to be built and then build it to make all the specs pass.

_NOTE_: The logic will not be identical to that of Warcraft III... deal with it!

## Instructions

There are multiple test files provided. Each file progresses our development of the game further.

In order to set up the environment properly to run the tests, we are going to introduce you to `bundler` which is a ruby utility that manages your application's dependencies. As we are going to start requiring multiple "helper" libraries, this is a good time to start learning best practices for maintaining your apps.

## Setup
Once you clone the gist, `cd` into the directory and run the command `bundle install`. This will read the `Gemfile` that is located in the directory and install all of the necessary dependencies, specifically in the versions that we want them.

Run each set of tests (specs) as using the `bundle exec rspec` command from the project's root directory via command line: `bundle exec rspec spec/test_01.rb`.

RSpec will output the results and initially you will see a bunch of failing tests. Your goal is the make all the tests pass for that file, before proceeding onto the next test file.

### Steps

1. Read the CODE for the spec file that you ran
2. Understand what tests it contains and what each test in that file is expecting
3. Start implementing your code to satisfy a particular test ("example")
4. Run the test suite using the same `bundle exec rspec` command to verify that your code is passing the test you are trying to pass
5. Repeat steps 1 through 4 until all tests pass for that suite.

Once all the tests are passing for that suite, run the next suite.

### Notes / Tips:

* In this assignment, you will only be reading/running RSpec files, not creating or modifying them.
* As such, do not modify the code in the `test_` files
* The `spec_helper.rb` file is just a convenience file that helps each test file require the files it needs to run. Do not edit it
* The tests will require you to create new classes as you progress. This means you should create a new file for that class (good practice, and what this project is already doing and expecting)
* Normal projects *do not* have their tests structured this way. We've done it here to facilitate incremental building and learning
* The `pry` gem is available to you (already required) incase you want to use `binding.pry` for debugging purposes

## External Resources

It is recommended that you consume these resources and understand their underlying concepts before starting the project.

Video: [Variable Scopes in Ruby](http://www.youtube.com/watch?v=iLxKNUFHAnY)  
StackOverflow: [Why use Ruby's attr_accessor, attr_reader, and attr_writer?](http://stackoverflow.com/questions/5046831/why-use-rubys-attr-accessor-attr-reader-and-attr-writer)  
StackOverflow: [What is attr_accessor in Ruby?](http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby)

## Topics covered:

* How to create a class
* How to create instance variables
* How to synthesize readers/accessors (`attr_reader`, `attr_accessor`)
* How to write a method
* How to write your own `initialize` method
* How to use inheritance to extend a class
* Extending / inheriting methods via `super`
