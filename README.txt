Initialized empty Git repository in /home/fusge/projects/moneypal/.git/

The project is ready to be used with git. If you are using GitHub, you may
push the project with the following commands from the project directory:

    git add .
    git commit -m "Initial commit"
    git remote add origin https://github.com/<your-account>/<repository>.git
    git push -u origin master

To get you started with the project in developer mode, you may configure,
build, install and test with the following commands from the project directory,
in that order:

    cmake --preset=dev
    cmake --build --preset=dev
    cmake --install build/dev --prefix prefix
    ctest --preset=dev

There are some convenience targets that you can run manually:

    docs - build the documentation using Doxygen and m.css
    run-exe - runs the executable built by the project

These targets are only available in developer mode, because they are generally
not useful for consumers. You can run these targets with the following command:

    cmake --build --preset=dev -t <target>

Now make sure you have at least CMake 3.20 installed for local development, to
make use of all the nice Quality-of-Life improvements in newer releases:
https://cmake.org/download/

For more tips, like integration with package managers, please see the Wiki:
https://github.com/friendlyanon/cmake-init/wiki

You are all set. Have fun programming and create something awesome!
