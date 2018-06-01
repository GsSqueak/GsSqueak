as yet unclassified
initialize
  graphicsLib := CLibrary named: '$GEMSTONE/lib/libgraFFIcs'.
  createWindowCo := CCallout
    library: graphicsLib
    name: #'ffi_create_window'
    result: #'ptr'
    args: #(#'uint32' #'uint32').
  drawWindowCo := CCallout
    library: graphicsLib
    name: #'ffi_draw_window'
    result: #'void'
    args: #(#'ptr' #'ptr').
  getSizeCo := CCallout
    library: graphicsLib
    name: #'ffi_get_window_size'
    result: #'void'
    args: #(#'ptr' #'ptr').
  setSizeCo := CCallout
    library: graphicsLib
    name: #'ffi_set_window_size'
    result: #'void'
    args: #(#'ptr' #'uint32' #'uint32').
  getEventsCo := CCallout
    library: graphicsLib
    name: #'ffi_process_events'
    result: #'void'
    args: #(#'ptr' #'ptr').
  displayStringCo := CCallout
    library: graphicsLib
    name: #'ffi_display_string'
    result: #'void'
    args: #(#'const char*' #'uint32' #'uint32' #'ptr' #'uint32' #'uint32').
  destroyWindowCo := CCallout
    library: graphicsLib
    name: #'ffi_destroy_window'
    result: #'void'
    args: #(#'ptr')