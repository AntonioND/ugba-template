libugba template
================

1. Preparation
--------------

This is a template of how to integrate `libugba`_ and `UMOD Player`_ in your
own project by adding them as submodules. Check `UGBA`_ for examples of what the
library can do.

Feel free to edit the ``CMakeLists.txt`` to enable the integration of graphics
and data using **grit** and **bin2c** respectively.

You can add files to the ``data`` folder, graphics to the ``graphics`` folder,
and music and SFX files to the ``audio`` folder. The build system will add them
to the build automatically.

2. Build for host
-----------------

It is built the same way as the main **UGBA** project. For example, in Linux, to
generate the PC binary:

.. code:: bash

    git clone --recurse-submodules https://github.com/AntonioND/ugba-template
    cd ugba-template
    mkdir build
    cd build
    cmake ..
    make -j`nproc`

3. Build for GBA
----------------

Clone the repository with its submodules:

.. code:: bash

    git clone --recurse-submodules https://github.com/AntonioND/ugba-template
    cd ugba-template

Build libugba and UMOD Player for GBA, as well as the packer for UMOD Player:

.. code:: bash

    cd libugba
    make
    cd ..

    cd umod-player/player
    make
    cd ..
    mkdir build
    cd build
    cmake ..
    make -j`nproc`
    cd ../..

Then you can build the template:

.. code:: bash

    make -j`nproc`

.. _libugba: https://github.com/AntonioND/libugba
.. _UGBA: https://github.com/AntonioND/ugba
.. _UMOD Player: https://github.com/AntonioND/umod-player
