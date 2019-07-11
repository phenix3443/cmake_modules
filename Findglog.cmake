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
#  glog_FOUND - System has glog
#  glog_INCLUDE_DIRS - The glog include directories
#  glog_LIBRARIES - The libraries needed to use glog
#  glog_DEFINITIONS - Compiler switches required for using glog


include(FindPkgConfig)
pkg_check_modules(glog REQUIRED libglog)

if(glog_FOUND)
  message(STATUS "Find glog by pkg")
else()
  find_path (glog_INCLUDE_DIR
    NAMES glog/logging.h
    )

  find_library (glog_LIBRARY
    NAMES glog
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args (glog DEFAULT_MSG
    glog_INCLUDE_DIR
    glog_LIBRARY
    )


  set(glog_INCLUDE_DIRS ${glog_INCLUDE_DIR})
  set(glog_LIBRARIES ${glog_LIBRARY})
endif()

message(STATUS "glog version: ${glog_VERSION}")
# message(STATUS "glog includes: ${glog_INCLUDE_DIRS}")
# message(STATUS "glog libraries: ${glog_LIBRARIES}")
