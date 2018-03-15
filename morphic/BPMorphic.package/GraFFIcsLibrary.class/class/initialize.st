as yet unclassified
initialize
  GraphicsLib := CLibrary named: '$GEMSTONE/lib/libgraFFIcs'.
  CreateWindowCo := CCallout
    library: GraphicsLib
    name: #'ffi_create_window'
    result: #'ptr'
    args: #(#'int32' #'int32' #'int32' #'int32').
  DrawWindowCo := CCallout
    library: GraphicsLib
    name: #'ffi_draw_window'
    result: #'void'
    args: #(#'ptr' #'ptr').
  GetEventsCo := CCallout
    library: GraphicsLib
    name: #'ffi_process_events'
    result: #'void'
    args: #(#'ptr' #'ptr').
  DisplayStringCo := CCallout
    library: GraphicsLib
    name: #'ffi_display_string'
    result: #'void'
    args: #(#'const char*' #'int32' #'int32' #'ptr' #'int32' #'int32')