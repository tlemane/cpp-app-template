# cpp-app-template


## Features

### CMake build

```bash
mkdir build && cd build && cmake .. -DWITH_TESTS=ON
```

* Tests: `make test`
* Coverage (requires `lcov`, `gcov` and `genhtml`):
  * `make coverage-report` (enabled only with `-DCMAKE_BUILD_TYPE=Coverage`)
* Doxygen: `make documentation`
* Clang format (requires `clang-format`):
  * `make format-lib` (format files at `./lib`)
  * `make format-app` (format files at `./app`)
* Packaging: `make package`

### Continuous integration

* Github Actions
  * Matrix build
    * Linux
      * Compiler: gcc8, gcc9, gcc10
      * Build type: Release, Debug
    * MacOS
  * Auto release
    * New release on new tag
    * Release files:
      * \<name>-vX.Y.Z-bin-Linux.tar.gz
      * \<name>-vX.Y.Z-bin-Darwin.tar.gz
      * \<name>-vX.Y.Z-sources.tar.gz (with submodules)
  * Coverage on Codecov