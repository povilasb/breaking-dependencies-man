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

#.
