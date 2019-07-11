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

# - Check for the presence of libevent headers and libraries
# Once done this will define
#  hiredis_FOUND - System has hiredis
#  hiredis_INCLUDE_DIRS - The hiredis include directories
#  hiredis_LIBRARIES - The libraries needed to use hiredis
#  hiredis_DEFINITIONS - Compiler switches required for using hiredis

include(FindPkgConfig)
pkg_check_modules(hiredis REQUIRED hiredis)

if(hiredis_FOUND)
  message(STATUS "Find hiredis by pkg")

else()
  find_path (hiredis_INCLUDE_DIR
    NAMES hiredis/hiredis.h
    )

  find_library (hiredis_LIBRARY
    NAMES hiredis
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args (hiredis DEFAULT_MSG
    hiredis_INCLUDE_DIR
    hiredis_LIBRARY
    )

  set(hiredis_INCLUDE_DIRS ${hiredis_INCLUDE_DIR})
  set(hiredis_LIBRARIES ${hiredis_LIBRARY})
endif()
message(STATUS "hiredis version: ${hiredis_VERSION}")
# message(STATUS "hiredis includes: ${hiredis_INCLUDE_DIRS}")
# message(STATUS "hiredis libraries: ${hiredis_LIBRARIES}")
