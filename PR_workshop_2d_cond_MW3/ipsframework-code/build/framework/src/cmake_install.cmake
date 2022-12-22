# Install script for directory: /home/dsamadd/ipsframework-code/framework/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ FILES
    "/home/dsamadd/ipsframework-code/framework/src/cca_es_spec.py"
    "/home/dsamadd/ipsframework-code/framework/src/component.py"
    "/home/dsamadd/ipsframework-code/framework/src/componentRegistry.py"
    "/home/dsamadd/ipsframework-code/framework/src/configobj.py"
    "/home/dsamadd/ipsframework-code/framework/src/configurationManager.py"
    "/home/dsamadd/ipsframework-code/framework/src/create_batch_script.py"
    "/home/dsamadd/ipsframework-code/framework/src/dataManager.py"
    "/home/dsamadd/ipsframework-code/framework/src/debug.py"
    "/home/dsamadd/ipsframework-code/framework/src/eventService.py"
    "/home/dsamadd/ipsframework-code/framework/src/eventServiceProxy.py"
    "/home/dsamadd/ipsframework-code/framework/src/ftbBridge.py"
    "/home/dsamadd/ipsframework-code/framework/src/ips-config.py"
    "/home/dsamadd/ipsframework-code/framework/src/ipsExceptions.py"
    "/home/dsamadd/ipsframework-code/framework/src/ipsLogging.py"
    "/home/dsamadd/ipsframework-code/framework/src/ipsTiming.py"
    "/home/dsamadd/ipsframework-code/framework/src/ips_es_spec.py"
    "/home/dsamadd/ipsframework-code/framework/src/ipsutil.py"
    "/home/dsamadd/ipsframework-code/framework/src/messages.py"
    "/home/dsamadd/ipsframework-code/framework/src/node_structure.py"
    "/home/dsamadd/ipsframework-code/framework/src/portalBridge.py"
    "/home/dsamadd/ipsframework-code/framework/src/resourceHelper.py"
    "/home/dsamadd/ipsframework-code/framework/src/resourceManager.py"
    "/home/dsamadd/ipsframework-code/framework/src/runspaceInitComponent.py"
    "/home/dsamadd/ipsframework-code/framework/src/services.py"
    "/home/dsamadd/ipsframework-code/framework/src/taskManager.py"
    "/home/dsamadd/ipsframework-code/framework/src/checklist.py"
    "/home/dsamadd/ipsframework-code/framework/src/dakota_bridge.py"
    "/home/dsamadd/ipsframework-code/framework/src/test_ips.py"
    "/home/dsamadd/ipsframework-code/framework/src/test_resource_parsing.py"
    "/home/dsamadd/ipsframework-code/framework/src/topicManager.py"
    "/home/dsamadd/ipsframework-code/framework/src/platformspec.py"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM PERMISSIONS OWNER_READ OWNER_EXECUTE OWNER_WRITE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES
    "/home/dsamadd/ipsframework-code/framework/src/ips_dakota_client.py"
    "/home/dsamadd/ipsframework-code/framework/src/ips_dakota_dynamic.py"
    "/home/dsamadd/ipsframework-code/framework/src/ips.py"
    "/home/dsamadd/ipsframework-code/framework/src/sendPost.py"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

