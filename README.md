# cpp-implementations

This repository contains implementations of chosen, interesting C++ standard library features. 
It also contains different implementations of other useful features from other libraries or own.

It focuses on the best implementation possible, unit testing, mocking and good practices.

## Goal

The goal of this project is to teach myself and others how certain features are implemented,
how to implement them in the best possible way and how to test them thoroughly.

This repository is PR open, every PR is appreciated, although certain restrictions and rules are put on every contributor.
The main reason is that the whole repository remains consistent.

If you have any remarks regarding the rules, the repo, the goal or anything, please file a PR with changes and describe them, or make an issue.

## Structure

The structure is as follows:
```
src/
├── other/
└── std/
```
**`std`** contains implementations of each chosen std:: feature, like `std::vector`, `std::string`, etc.
Each std:: feature should be implemented so that it can be used as a direct substitute for the std:: one, that means:
 - it should be standard conformant
 - it should be implemented in standard the feature came out (so `std::vector` should be implemented in C++98, `std::array` C++11, `std::variant` C++17).
 If one desires to implement a certain feature in other standard, it should be put under `src/other`.

**`other`** contains implementations of other library features, either from other libraries, modified std:: features or own ones.

Every feature should have it's own directory with it's name, in that directory there should be `src` or/and `include`, `test` and `example` directories and a `CMakeLists.txt` file.
If feature specific CMake configuration is needed, it can be put under `cmake/`, if you think the CMake config can be used by others, put it under `src/shared/cmake/`.
If you notice other features containing a suitable CMake configuration for the feature you want to add, move it from local `cmake/`, to `src/shared/cmake/` and make sure the feature you have changed
still compiles fine:
```
src/
├── shared/
    └── cmake/
├── other/
│   └── CMakeLists.txt
└── std/
    ├── CMakeLists.txt
    └── vector/
        ├── CMakeLists.txt
        ├── README.md
        ├── examples/
        ├── include/
        ├── src/ # not needed in this case
        ├── cmake/ # not needed in this case
        └── tests/
```
If the feature doesn't have any .cpp (where most of the time it should not) files, `src` can be omitted. 
`examples` folder should contain at least one example
`tests` folder should contain at least one, but ideally a complete set of tests for the object.

Every feature should have a `README.md` file that, minimally, lists all the users that contributed to a certain feature.
Ideally the readme file should also contain a description of the feature, implementation details, design choices and possibly examples. 

The `CMakeLists.txt` file **in a root of std/ and other/** should only have `add_subdirectory` calls to

The `CMakeLists.txt` file **for each feature** should contain a valid CMake code that produces example binaries and runs tests/produces test binary.
The binaries should be produced under `${CPP_IMPL_BUILD}/feature_name/`. Every example binary should be prefixed with `example-`, every test binary should be prefixed with `test-`

## Build system

The build system of choice is unfortunately **CMake** The reason is that it's the most widely used one, many people are familiar with it and it's used broadly in the industry.

## Testing

The default testing library is **catch2**, if you wish to use google test, ctest, or any other library - feel free to modify and add needed files.
