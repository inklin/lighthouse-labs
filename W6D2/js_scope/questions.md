JavaScript Scope
================
Use the information in this article to answer the following three questions.

http://toddmotto.com/everything-you-wanted-to-know-about-javascript-scope/

Each answer should be one to two paragraphs in length. You may discuss the questions with mentors and peers, but the answers must be in your own words.

Question 1
----------
What is meant by the following statement?

A function doesn't have to return in order to be called a closure. Simply accessing variables outside of the immediate lexical scope creates a closure.

In JavaScript, if you declare a function inside another function, you are creating a closure. (But if you use the new Function(), function constructor, you are not creating a closure because the new function cannot reference the variables in the outer function.)

Closures:
When a function is inside another function, the inner function has access to the scope in the outer function. This is called a closure. Any variables/objects/functions defined in the outer function, are available in the inner function. A closure (an inner function) has access to the outer function's variables. A closure has 3 scope chains: access to its own scope, access to the outer functions's variables, and access to the global variables.

Scope Chain
Scope chains define the scope for a given function. The position in the code defines the scope. 

Question 2
----------
How does the following code work?

  function findLargestNumber(arrayOfNumbers) {
    return Math.max.apply(null, arrayOfNumbers);
  }

This function takes in an array as a parameter. The apply method's first parameter is the context (the object that 'this' will be binded to), the second parameter takes in an array of arguments to be passed in to the function. The apply method combined with the Math.max method allows us to find the maximum value in the array.

Since context does not matter for max value, context is null, and the arguments being passed in are the array of numbers (arrayOfNumbers). Math.max.apply(null, arrayOfNumbers) is the same as Math.max(number1, number2, number3, number4...), passing in all the numbers in the array as parameters to the Math.max function.

JavaScript has a new spread operator with ES6 that can do the same thing:

  function findLargestNumber(arrayOfNumbers){
    return Math.max(...arrayOfNumbers);
  }

Question 3
----------
What is the purpose of the module pattern?