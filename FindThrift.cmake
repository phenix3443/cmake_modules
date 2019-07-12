#--------------------------------------------------------------------------------
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

# - Check for the presence of Thrift headers and libraries
# Once done this will define
#  Thrift_FOUND - System has Thrift
#  Thrift_INCLUDE_DIRS - The Thrift include directories
#  Thrift_LIBRARIES - The libraries needed to use Thrift
#  Thrift_DEFINITIONS - Compiler switches required for using Thrift

include(FindPkgConfig)
pkg_check_modules(Thrift thrift)

if(Thrift_FOUND)
  message(STATUS "Find Thrift by pkg")
else()
  find_path (Thrift_INCLUDE_DIR
    NAMES thrift/Thrift.h
    )

  find_library (Thrift_LIBRARY
    NAMES thrift
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args (Thrift DEFAULT_MSG
    Thrift_INCLUDE_DIR
    Thrift_LIBRARY
    )

  set(Thrift_INCLUDE_DIRS ${Thrift_INCLUDE_DIR})
  set(Thrift_LIBRARIES ${Thrift_LIBRARY})
endif()

message(STATUS "Thrift version: ${Thrift_VERSION}")
# message(STATUS "Thrift includes: ${Thrift_INCLUDE_DIRS}")
# message(STATUS "Thrift libraries: ${Thrift_LIBRARIES}")
