find_program(CPPCHECK_BIN NAMES cppcheck DOC "Path to cppcheck executable")

if (CPPCHECK_BIN)
  message(STATUS "Found: cppcheck")
  list(APPEND CMAKE_CXX_CPPCHECK "${CPPCHECK_BIN}"
       "--enable=all"
       "--enable=warning,performance,portability"
       "--check-config"
       "--suppressions-list=${PROJECT_SOURCE_DIR}/cmake/cppcheck_suppr.txt"
       "--xml"
       "--output-file=${PROJECT_BINARY_DIR}/cppcheck.xml"
  )
endif()