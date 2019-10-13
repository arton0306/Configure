# virtualenv

### The basic idea of virtualenv

1.  copying python related executables and libs to an assigned folder
2.  setup corresponding environment
3.  prefix the prompt so the client can know the name of environment

so the user can work in the folder as in an isolated environment. Now, if we use pip install in the environment, the package will only be installed in the environment. With virtualenv, we can keep our system environment clean.

Because the virtual env bases on the folder, we can remove the virtual env by just removing the folder.

### The steps to use virtualenv

1.  pip install virtualenv
2.  virtaulenv `dirname`
    *  If you have several python version in your system, and you want to assign specific python version, use `--/<python bin path>`
    *  In default, the environment will contain the python libs in system. If you do not need these python libs, use `--no-site-packages`
2.  cd `dirname`
3.  source `bin/activate`
4.  ...work here
5.  use `deactivate` to quit the environment

### Memo
An environment variable `PIP_REQUIRE_VIRTUALENV` is used to check if pip is run under virtual env.