UGBA template
=============

1. Preparation
--------------

This is a template of how to integrate `libugba`_ and `UMOD Player`_ in your
own project by adding them as submodules. Check `UGBA Testing`_ for examples of
what the library can do.

You can add files to the ``data`` folder, graphics to the ``graphics`` folder,
and music and SFX files to the ``audio`` folder. The build system will add them
to the build automatically.

Before building this template, check the `libugba`_ repository and install the
dependencies that the readme mentions.

2. Build for host
-----------------

Just run the following commands:

.. code:: bash

    git clone --recurse-submodules https://github.com/AntonioND/ugba-template
    cd ugba-template
    bash assets.sh
    mkdir build
    cd build
    cmake ..
    make -j`nproc`

3. Build for GBA
----------------

This will build the GBA and host targets at he same time:

.. code:: bash

    git clone --recurse-submodules https://github.com/AntonioND/ugba-template
    cd ugba-template
    bash assets.sh
    mkdir build
    cd build
    cmake .. -DBUILD_GBA=ON
    make -j`nproc`

.. _libugba: https://github.com/AntonioND/libugba
.. _UGBA Testing: https://github.com/AntonioND/ugba-testing
.. _UMOD Player: https://github.com/AntonioND/umod-player
