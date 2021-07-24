find_program(CPPCHECK_BIN NAMES cppcheck DOC "Path to cppcheck executable")
find_program(CPPCHECK_HTML_BIN NAMES cppcheck-htmlreport "Path to cppcheck-htmlreport executable")

if (CPPCHECK_BIN AND WITH_CPPCHECK)
  list(APPEND CMAKE_CXX_CPPCHECK "${CPPCHECK_BIN}"
       "--enable=all"
       "--enable=warning,performance,portability"
       "--check-config"
       "--suppressions-list=${PROJECT_SOURCE_DIR}/cmake/cppcheck_suppr.txt"
       "--xml"
       "--output-file=${PROJECT_BINARY_DIR}/cppcheck.xml"
  )

  if (CPPCHECK_HTML_BIN)
    message(STATUS "Found: cppcheck, cppcheck-htmlreport, add target 'cppcheck-report'")
    add_custom_target(cppcheck-report
                      COMMAND ${CPPCHECK_HTML_BIN} --report-dir=./cppcheck-report --file=./cppcheck.xml --source-dir=..
                      WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
  endif()
endif()