In this exercise, we will take a step back from testing and create a mini program with multiple classes that inherit from each other. At the end of the exericse, if you have enough time and energy, you are definitely encouraged to write RSpec tests.

# Classical Inheritance
A big part of Object Oriented Programming is Inheritance. In languages such as Ruby, Python, Java, PHP, etc objects are defined as classes and classes can inherit from other classes.

This type of class-based inheritance is officially referred to as "Classical Inheritance".

Think of inheritance visually as an upside-down tree-like structure, with "Object" at the root of the tree.

Here's a simple explanation from Programming Ruby (a.k.a. the Pickaxe):

Inheritance allows you to create a class that is a refinement or specialization of another class. This class is called a subclass of the original, and the original is a superclass of the subclass. People also talk of child and parent classes. The basic mechanism of subclassing is simple. The child inherits all of the capabilities of its parent class--all the parent's instance methods are available in instances of the child.
Additionally, you may want to read about inheritance in Ruby.

Objectives
## 1. Setup: A bunch of animals
Define 8 empty classes: Animal, Mammal, Amphibian, Primate, Frog, Bat, Parrot, and Chimpanzee.

Set up an inheritance structure that makes sense given the phylogenetic position of the animal in relation to the others.

## 2. Add some properties
Add instance variables and methods to your different classes. These could include things like @num_legs or #warm_blooded? (note the # is convention to imply that warm_blooded? should be defined a public method, and is not explicit ruby code).

Make up your own methods and attributes that make sense on each class.

Then write a script to prove that your inheritance structure works. If you assign @num_legs = 2 in the Primate class, does an instance of Chimpanzee have the same variable and value?

Hint: you may have to define some reader methods.

## 3. More abilities with a Module
This objective is to learn about using modules and mixins as a valuable part of the OOP architecture. Inheritance isn't going to work very well to solve this. We need multiple inheritance. However, unlike C++ and Python, Ruby does not support multi-inheritance. This is because Ruby has modules which allow us to kind of do that by mixing in behaviour into multiple classes. This is done via include.

Here are some links which you can use to get more familiar with the concepts:

[Ruby Modules](http://www.tutorialspoint.com/ruby/ruby_modules.htm)
[Ruby doc on Modules](http://www.ruby-doc.org/core-2.1.2/Module.html)
[Uses for Modules](http://blog.rubybestpractices.com/posts/gregory/037-issue-8-uses-for-modules.html)
[Uses for Modules Part 2](http://blog.rubybestpractices.com/posts/gregory/038-issue-9-uses-for-modules.html)

Allow birds to fly by calling #fly on them. Create a module Flight with a fly method and an airspeed_velocity reader and writer method.

Then use your module as a mixin for one or more of your classes, where appropriate.

For output, when your Parrot class flies, it should output I'm a parrot, I'm flying!.

What would your Bat class output?

## 4. Tests (Extra Credit / Optional)
This objective is also optional (for this exercise)

Write RSpec tests to make sure your classes are indeed exhibiting the intended behavior. As we've discussed previously, writing tests is a better alternative to creating driver code with puts statements everywhere.