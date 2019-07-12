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
#  libevent_FOUND - System has libevent
#  libevent_INCLUDE_DIRS - The libevent include directories
#  libevent_LIBRARIES - The libraries needed to use libevent
#  libevent_DEFINITIONS - Compiler switches required for using libevent

include(FindPkgConfig)
pkg_check_modules(libevent libevent)

if(libevent_FOUND)
  message(STATUS "Find libevent by pkg")
else()
  find_path (libevent_INCLUDE_DIR
    NAMES event2/event.h event.h
    )

  find_library (libevent_LIBRARY
    NAMES event
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args (libevent DEFAULT_MSG
    libevent_INCLUDE_DIR
    libevent_LIBRARY
    )

  set(libevent_INCLUDE_DIRS ${libevent_INCLUDE_DIR})
  set(libevent_LIBRARIES ${libevent_LIBRARY})
endif()
message(STATUS "libevent version: ${libevent_VERSION}")
# message(STATUS "libevent includes: ${libevent_INCLUDE_DIRS}")
# message(STATUS "libevent libraries: ${libevent_LIBRARIES}")
