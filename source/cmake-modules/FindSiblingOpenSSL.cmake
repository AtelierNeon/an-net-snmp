if (EXISTS "${PROJECT_SOURCE_DIR}/../openssl/include/")
  message (STATUS "Sibling OpenSSL found.")
  set (OPENSSL_FOUND True)
  set (OPENSSL_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/../openssl/include/")
  if (EXISTS "${PROJECT_BINARY_DIR}/../openssl/include/")
    list (APPEND OPENSSL_INCLUDE_DIRS "${PROJECT_BINARY_DIR}/../openssl/include/")
  endif ()
  set (OPENSSL_CRYPTO_LIBRARY crypto)
  set (OPENSSL_SSL_LIBRARY ssl)
  set (OPENSSL_LIBRARIES
    ${OPENSSL_CRYPTO_LIBRARY}
    ${OPENSSL_SSL_LIBRARY})
else ()
  message (STATUS "Sibling OpenSSL NOT found.")
endif ()