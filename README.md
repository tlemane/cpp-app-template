# cpp-app-template

A c++ project template.

## Features

### CMake build

* Compile options:
  * CMAKE_BUILD_TYPE=Release|Debug|RelWithDebInfo|Profile|Coverage (default: Release)
  * STATIC_BUILD=ON|OFF (default: OFF)
  * DEV_BUILD=ON|OFF (default: OFF) : [Dev mode build](https://github.com/tlemane/cpp-app-template/blob/master/CMakeLists.txt#L26)
  * BUILD_SHARED_LIBS=ON|OFF (default: OFF): Build lib as a static library
  * WITH_TESTS=ON|OFF (default: ON): Compile unit tests
  * WITH_DOC=ON|OFF (default: ON): add `documentation` target
  * WITH_CPPCHECK=ON|OFF (default: ON): add `cppcheck-report` target
  * WITH_CLANGFORMAT=ON|OFF (default: ON): add `format-lib` & `format-app` target
  * WITH_COVERAGE=ON|OFF (default: ON, ignored if CMAKE_BUILD_TYPE != Coverage): add `coverage-report` target

```bash
mkdir build && cd build && cmake .. && make
```

* Application binary: `build/app/*`
* Lib : `build/lib/*`
* Configuration header : `build/include/*`

#### Tests

```bash
cmake .. -DWITH_TESTS=ON && make && make test
```
#### Coverage

```bash
cmake .. -DCMAKE_BUILD_TYPE=Coverage -DWITH_TESTS=ON -DWITH_COVERAGE=ON && make && make coverage-report
```

#### CppCheck

```bash
cmake .. -DWITH_CPPCHECK=ON && make && make cppcheck-report
```
#### Doxygen

```bash
cmake .. -DWITH_DOC=ON && make && make documentation
```

#### ClangFormat

Configuration: `.clang-format`

```bash
cmake .. -DWITH_CLANGFORMAT=ON && make format-lib && make format-app
```
#### Packaging

Configuration: `cmake/CPackConfig.cmake`

```bash
cmake .. && make && make package
```

### Github Action CI

#### Matrix build

* os: Ubuntu-20.04, MacOS 10.15
* compiler (Linux only): gcc8, gcc9, gcc10

#### Code coverage

* Automatic report on [CodeCov](https://app.codecov.io/gh/tlemane/cpp-app-template/).

#### Automatic release

1. Create a changelog file


```
> cat docs/changelogs/v9.9.9.md
### cpp-app-template v9.9.9
* Auto release example
```

2. Add a new tag

```
git tag v9.9.9
git push origin v9.9.9
```

A new release is then created by Github Actions with the content of `docs/changelogs/v9.9.9.md` as description and with the following assets:
  * `<name>-v9.9.9-bin-Linux.tar.gz` (compiled binary for Linux)
  * `<name>-v9.9.9-bin-Darwin.tar.gz` (compiled binary for MacOS)
  * `<name>-v9.9.9-sources.tar.gz` (sources including submodules)