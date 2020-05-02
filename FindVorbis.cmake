include(FindPackageHandleStandardArgs)

find_path(VORBIS_INCLUDE_DIR vorbis/vorbisfile.h)

mark_as_advanced(VORBIS_INCLUDE_DIR)

set(VORBIS_INCLUDE_DIRS ${VORBIS_INCLUDE_DIR})

find_library(VORBIS_LIBRARY NAMES vorbis)
find_library(VORBIS_VORBISFILE_LIBRARY NAMES vorbisfile)
find_library(VORBIS_VORBISENC_LIBRARY NAMES vorbisenc)

mark_as_advanced(
	VORBIS_LIBRARY
	VORBIS_VORBISFILE_LIBRARY
	VORBIS_VORBISENC_LIBRARY
)

set(
	VORBIS_LIBRARIES
	${VORBIS_LIBRARY}
	${VORBIS_VORBISFILE_LIBRARY}
	${VORBIS_VORBISENC_LIBRARY}
)

find_package_handle_standard_args(
	Vorbis
	DEFAULT_MSG
	VORBIS_INCLUDE_DIRS
	VORBIS_LIBRARIES
)

if(VORBIS_FOUND AND NOT TARGET Vorbis::Vorbis)
	add_library(Vorbis::Vorbis UNKNOWN IMPORTED)
	set_target_properties(Vorbis::Vorbis PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${VORBIS_INCLUDE_DIR}")
	set_property(TARGET Vorbis::Vorbis APPEND PROPERTY IMPORTED_LOCATION "${VORBIS_LIBRARY}")
endif()
	
if(VORBIS_FOUND AND NOT TARGET Vorbis::VorbisFile)
	add_library(Vorbis::VorbisFile UNKNOWN IMPORTED)
	set_target_properties(Vorbis::VorbisFile PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${VORBIS_INCLUDE_DIR}")
	set_property(TARGET Vorbis::VorbisFile APPEND PROPERTY IMPORTED_LOCATION "${VORBIS_VORBISFILE_LIBRARY}")
endif()
	
if(VORBIS_FOUND AND NOT TARGET Vorbis::VorbisEnc)
	add_library(Vorbis::VorbisEnc UNKNOWN IMPORTED)
	set_target_properties(Vorbis::VorbisEnc PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${VORBIS_INCLUDE_DIR}")
	set_property(TARGET Vorbis::VorbisEnc APPEND PROPERTY IMPORTED_LOCATION "${VORBIS_VORBISENC_LIBRARY}")
endif()
