This folder contains the following challenge

Challenge #3

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
Example Inputs
object = {“a”:{“b”:{“c”:”d”}}}
key = a/b/c
object = {“x”:{“y”:{“z”:”a”}}}
key = x/y/z
value = a

 

## First things first - Why Node?

>Node is just a javascript code that doesn't have stringly typed data structures, which makes it hard and every fucntion input needs to be validated befofe doing any compute on it. I found it challenging to ensure that all the edge cases are covered during the input validation

  

# Approach

Define a function that takes two parameters named

> object : the full JSON object
> keys : an Array of keys in the order

 
 # Assumptions

 - There will be at least **one key** to search 
 - Any invalid key will return **null**
 - The Keys are given in the order as it would appear in the JSON tree

 # Testing

I am going to use Mocha javascript testing framework to do the unit testing 

# Compute complexity

 - Space Complexity **O(1)**
 - Time Complexity **O(N)** where **N** is the depth of the tree.  


 # Environment

 - Clone the project
 - Install dependencies
 >npm install
 - Test the project
 >npm test  

