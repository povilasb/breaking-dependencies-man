==============================
Dependency breaking techniques
==============================


Adapt parameter
===============


When to use?
------------

When you are not able to create method parameter or you want to test effects
on specific parameter. Or when *EXTRACT INTERFACE* is not possible or
impractical.


Steps
-----

#. Create the new interface that you will use in the method. Make it as simple
   and communicative as possible, but try not to create an interface that
   will require more than trivial changes in the method.

#. Create a production implementer for the new interface.

#. Create a fake implementer for the interface.

#. Write a simple test case, passing the fake to the method.

#. Make the changes you need to in the method to use the new parameter.

#. Run your test to verify that you are able to test the method using the fake.


Example
-------

TODO


Break out method object
=======================

The idea behind this refactoring is to move a long method to a class. Objects
that you create using that new class are called method objects because they
embody the code of a single method. After refactoring you can ofthen write test
for the new class easier than you could for the old method. Local variables
in the old method can become instance variables in the new class. Often
that makes it easier to break dependencies and move the code to a better
state.


When to use?
------------

If the method that you have to work with is very large or uses instance data
and methods.


Steps
-----

You can use these steps to do Break out Method Object safely without tests:

#. Create the class that will house the method code.

#. Create constructor and **Preserve Signatures** to give it an exact copy
   of the arguments used by the method. If the method uses and instance data
   or methods from the original class, add a reference to the original class
   as the first argument to the constructor.

#. For each argument in the constructor, declare an instance variable and
   give it exactly the same type as the variable. **Preserve Signatures**
   by copying all the arguments directly into the class and formatting them
   as instance variable declarations. Assign all of the arguments to the
   instance variables in the constructor.

#. Create an empty execution method on the new class. Often this method is
   called `run()`.

#. Copy the body of the old method into the execution method and compile to
   **Lean on the compiler**.

#. The error messages from the compiler should indicate where the method is
   still using methods or variables from the old class. In each of these cases,
   do what it takes to get the method to compile. In some cases, this is as
   simple as changing a call to use the reference to the original class. In
   other cases, you might have to make methods public on the original class
   or introduce getters so you don't have to make instance variables public.

#. After the new class compiles, go back to the original method and change it
   so that it creates an instance of the new class and delegates it's work to
   it.

#. If needed, use **Extract Interface** to break dependencies on the original
   class.


Example
-------

TODO
