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

# OpenSSL_FOUND - System has OpenSSL
# OpenSSL_INCLUDE_DIRS - The OpenSSL include directories
# OpenSSL_LIBRARIES - The libraries needed to use OpenSSL
# OpenSSL_VERSION - Compiler switches required for using OpenSSL

include(FindPkgConfig)
pkg_check_modules(OpenSSL openssl)

if(OpenSSL_FOUND)
  message(STATUS "Find OpenSSL by pkg")
else()
  find_path(OpenSSL_INCLUDE_DIR
    NAMES openssl/ssl.h
    )

  find_library(OpenSSL_LIBRARY
    NAMES maxminddb
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(OpenSSL DEFAULT_MSG
    OpenSSL_INCLUDE_DIR
    OpenSSL_LIBRARY
    )

  # Extract version number if possible.
  set(VERSION_REGEX "^#[ \t]*define[ \t]+PACKAGE_VERSION[ \t]+\"(([0-9]+)\\.([0-9]+)\\.([0-9]+)[^\"]*)\".*$")
  if(OpenSSL_INCLUDE_DIR AND EXISTS "${OpenSSL_INCLUDE_DIR}/maxminddb.h")
    file(STRINGS "${OpenSSL_INCLUDE_DIR}/maxminddb.h" VERSION_H REGEX "${VERSION_REGEX}")
  else()
    set(VERSION_H "")
  endif()
  if(VERSION_H MATCHES "${VERSION_REGEX}")
    set(OpenSSL_VERSION "${CMAKE_MATCH_1}")
    set(OpenSSL_VERSION_MAJOR "${CMAKE_MATCH_2}")
    set(OpenSSL_VERSION_MINOR "${CMAKE_MATCH_3}")
    set(OpenSSL_VERSION_PATCH "${CMAKE_MATCH_4}")
  else()
    set(OpenSSL_VERSION "")
    set(OpenSSL_VERSION_MAJOR "")
    set(OpenSSL_VERSION_MINOR "")
    set(OpenSSL_VERSION_PATCH "")
  endif()
  unset(VERSION_REGEX)
  unset(VERSION_H)

  set(OpenSSL_INCLUDE_DIRS ${OpenSSL_INCLUDE_DIR})
  set(OpenSSL_LIBRARIES ${OpenSSL_LIBRARY})
endif()

message(STATUS "OpenSSL version: ${OpenSSL_VERSION}")
# message(STATUS "OpenSSL includes: ${OpenSSL_INCLUDE_DIRS}")
# message(STATUS "OpenSSL libraries: ${OpenSSL_LIBRARIES}")
