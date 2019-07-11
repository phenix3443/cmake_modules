# Copyright (c) 2019-2020, phenix3443<phenix3443@gmail.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
#  * Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#--------------------------------------------------------------------------------

# - Check for the presence of MaxMindDB headers and libraries
# Once done this will define

# MaxMindDB_FOUND - System has MaxMindDB
# MaxMindDB_INCLUDE_DIRS - The MaxMindDB include directories
# MaxMindDB_LIBRARIES - The libraries needed to use MaxMindDB
# MaxMindDB_VERSION - Compiler switches required for using MaxMindDB

include(FindPkgConfig)
pkg_check_modules(MaxMindDB REQUIRED maxminddb)

if(MaxMindDB_FOUND)
  message(STATUS "Find MaxMindDB by pkg")
else()
  find_path(MaxMindDB_INCLUDE_DIR
    NAMES maxminddb.h
    )

  find_library(MaxMindDB_LIBRARY
    NAMES maxminddb
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(MaxMindDB DEFAULT_MSG
    MaxMindDB_INCLUDE_DIR
    MaxMindDB_LIBRARY
    )

  # Extract version number if possible.
  set(VERSION_REGEX "^#[ \t]*define[ \t]+PACKAGE_VERSION[ \t]+\"(([0-9]+)\\.([0-9]+)\\.([0-9]+)[^\"]*)\".*$")
  if(MaxMindDB_INCLUDE_DIR AND EXISTS "${MaxMindDB_INCLUDE_DIR}/maxminddb.h")
    file(STRINGS "${MaxMindDB_INCLUDE_DIR}/maxminddb.h" VERSION_H REGEX "${VERSION_REGEX}")
  else()
    set(VERSION_H "")
  endif()
  if(VERSION_H MATCHES "${VERSION_REGEX}")
    set(MaxMindDB_VERSION "${CMAKE_MATCH_1}")
    set(MaxMindDB_VERSION_MAJOR "${CMAKE_MATCH_2}")
    set(MaxMindDB_VERSION_MINOR "${CMAKE_MATCH_3}")
    set(MaxMindDB_VERSION_PATCH "${CMAKE_MATCH_4}")
  else()
    set(MaxMindDB_VERSION "")
    set(MaxMindDB_VERSION_MAJOR "")
    set(MaxMindDB_VERSION_MINOR "")
    set(MaxMindDB_VERSION_PATCH "")
  endif()
  unset(VERSION_REGEX)
  unset(VERSION_H)

  set(MaxMindDB_INCLUDE_DIRS ${MaxMindDB_INCLUDE_DIR})
  set(MaxMindDB_LIBRARIES ${MaxMindDB_LIBRARY})
endif()

message(STATUS "MaxMindDB version: ${MaxMindDB_VERSION}")
# message(STATUS "MaxMindDB includes: ${MaxMindDB_INCLUDE_DIRS}")
# message(STATUS "MaxMindDB libraries: ${MaxMindDB_LIBRARIES}")
