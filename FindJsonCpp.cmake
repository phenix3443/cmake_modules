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

# - Check for the presence of JsonCpp headers and libraries
# Once done this will define
#  JsonCpp_FOUND - System has JsonCpp
#  JsonCpp_INCLUDE_DIRS - The JsonCpp include directories
#  JsonCpp_LIBRARIES - The libraries needed to use JsonCpp
#  JsonCpp_DEFINITIONS - Compiler switches required for using JsonCpp

include(FindPkgConfig)
pkg_check_modules(JsonCpp REQUIRED jsoncpp)

if(jsoncpp_FOUND)
  message(STATUS "Find JsonCpp by pkg")
else()
  find_path(JsonCpp_INCLUDE_DIR
    NAMES json/json.h
    PATH_SUFFIXES jsoncpp
    )

  find_library(JsonCpp_LIBRARY
    NAMES jsoncpp
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(JsonCpp DEFAULT_MSG
    JsonCpp_INCLUDE_DIR
    JsonCpp_LIBRARY
    )
  set(JsonCpp_INCLUDE_DIRS ${JsonCpp_INCLUDE_DIR})
  set(JsonCpp_LIBRARIES ${JsonCpp_LIBRARY})
endif()

message(STATUS "JsonCpp version: ${JsonCpp_VERSION}")
# message(STATUS "JsonCpp includes: ${JsonCpp_INCLUDE_DIRS}")
# message(STATUS "JsonCpp libraries: ${JsonCpp_LIBRARIES}")
