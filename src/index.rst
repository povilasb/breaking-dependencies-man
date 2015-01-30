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


.. todo::
