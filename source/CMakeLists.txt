cmake_minimum_required (VERSION 3.1)

## Dummy basic information for meta project
project (main)

## Append custom CMake module path
list (APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake-modules/")

## Process sub-components
add_subdirectory (net-snmp)
add_subdirectory (openssl)
