cmake_minimum_required(VERSION 3.5)

project(hiscore CXX)

set(SOURCES
	kaitai/kaitaistream.cpp
	hiscore.cpp
	main.cpp
)

set(HEADERS
	kaitai/kaitaistream.h
    kaitai/kaitaistruct.h
   	hiscore.h
)

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

target_include_directories(
	${PROJECT_NAME}
	PRIVATE
	${PROJECT_SOURCE_DIR}
)

target_link_libraries(
	${PROJECT_NAME}
)

target_compile_definitions(
	${PROJECT_NAME}
	PRIVATE
)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
