set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/tests_bin/)
set (CMAKE_CXX_CPPCHECK "")

file(GLOB_RECURSE SRC_FILE "${PROJECT_SOURCE_DIR}/tests/unit/test_*.cpp")
set(TARGET_NAME ${PROJECT_NAME}-test)
add_executable(${TARGET_NAME} ${SRC_FILE})
add_dependencies(${TARGET_NAME} ${LIB_DEPENDENCIES})
target_include_directories(${TARGET_NAME} PRIVATE ${TEST_INCLUDE_DIR})
target_link_directories(${TARGET_NAME} PRIVATE ${TEST_LINK_DIR})
target_link_libraries(${TARGET_NAME} ${LIBRARY_NAME} ${TEST_LINK} pthread)

add_test(NAME ${TARGET_NAME} COMMAND sh -c "${PROJECT_BINARY_DIR}/tests_bin/${TARGET_NAME}")

if (CMAKE_BUILD_TYPE STREQUAL "Coverage" AND COVERAGE_BIN STREQUAL "1" AND WITH_COVERAGE)
  message(STATUS "Found: gcov, lcov, genhtml. add target 'coverage-report'")
  target_coverage(coverage-report
                  ${PROJECT_BINARY_DIR}/tests_bin/${TARGET_NAME}
                  ${PROJECT_BINARY_DIR}/coverage_reports)
endif()