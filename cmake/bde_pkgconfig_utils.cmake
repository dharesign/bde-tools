include(bde_include_guard)
bde_include_guard()

# pkgconfig <-> our names exception map
macro(_pkgconfig_map_insert uorName pkgconfigName )
    set( _uor_to_pkgconfig_map_${uorName} ${pkgconfigName} )
    set( _pkgconfig_to_uor_map_${pkgconfigName} ${uorName} )
endmacro()

_pkgconfig_map_insert(z          zlib)
_pkgconfig_map_insert(protobuf-c libprotobuf-c)
_pkgconfig_map_insert(xercesc    xerces-c)
_pkgconfig_map_insert(curl       libcurl)
_pkgconfig_map_insert(apr1       apr-1)
_pkgconfig_map_insert(aprutil1   apr-util-1)
_pkgconfig_map_insert(glib2      glib-2.0)
_pkgconfig_map_insert(gobject2   gobject-2.0)
_pkgconfig_map_insert(uv         libuv)
_pkgconfig_map_insert(svm        libsvm)

function(bde_uor_to_pkgconfig_name retPkgconfigName uorName)
    bde_assert_no_extra_args()
    if(DEFINED _uor_to_pkgconfig_map_${uorName})
        bde_return(${_uor_to_pkgconfig_map_${uorName}})
    endif()

    string(REPLACE "_" "-" sanitizedName "${uorName}")
    bde_return(${sanitizedName})
endfunction()

function(bde_pkgconfig_to_uor_name retUorName pkgconfigName)
    bde_assert_no_extra_args()
    if(DEFINED _pkgconfig_to_uor_map_${pkgconfigName})
        bde_return(${_pkgconfig_to_uor_map_${uorName}})
    endif()

    string(REPLACE "-" "_" sanitizedName "${pkgconfigName}")
    bde_return(${sanitizedName})
endfunction()
