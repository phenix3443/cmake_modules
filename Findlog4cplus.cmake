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

# - Check for the presence of log4cplus headers and libraries
#
# The following variables are set when log4cplus is found:
# Once done this will define
#  log4cplus_FOUND - System has log4cplus
#  log4cplus_INCLUDE_DIRS - The log4cplus include directories
#  log4cplus_LIBRARIES - The libraries needed to use log4cplus
#  log4cplus_DEFINITIONS - Compiler switches required for using log4cplus

include(FindPkgConfig)
pkg_check_modules(log4cplus log4cplus)

if(log4cplus_FOUND)
  message(STATUS "Find log4cplus by pkg")
else()
  find_path (log4cplus_INCLUDE_DIR
    NAMES log4cplus/config.hxx
    )

  find_library (log4cplus_LIBRARY
    NAMES log4cplus
    PATH_SUFFIXES lib
    )

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args (log4cplus DEFAULT_MSG
    log4cplus_INCLUDE_DIR
    log4cplus_LIBRARY
    )

  set(log4cplus_INCLUDE_DIRS ${log4cplus_INCLUDE_DIR})
  set(log4cplus_LIBRARIES ${log4cplus_LIBRARY})

endif()
message(STATUS "log4cplus version: ${log4cplus_VERSION}")
# message(STATUS "log4cplus includes: ${log4cplus_INCLUDE_DIRS}")
# message(STATUS "log4cplus libraries: ${log4cplus_LIBRARIES}")
