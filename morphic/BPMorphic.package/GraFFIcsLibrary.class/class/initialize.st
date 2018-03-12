as yet unclassified
initialize
  GraphicsLib := CLibrary named: '$GEMSTONE/lib/libgraFFIcs'.
  CreateWindowCo := CCallout
    library: GraphicsLib
    name: #'openWindow'
    result: #'void'
    args: #(#'int32' #'int32' #'int32' #'int32').
  DrawBitmapCo := CCallout
    library: GraphicsLib
    name: #'drawBitmap'
    result: #'int32'
    args: #(#'ptr' #'int32' #'int32' #'int32' #'int32').
  GetEventsCo := CCallout
    library: GraphicsLib
    name: #'getEvents'
    result: #'void'
    args: #(#'ptr').
  DisplayStringCo := CCallout
    library: GraphicsLib
    name: #'displayString'
    result: #'void'
    args: #(#'const char*' #'int32' #'int32' #'ptr' #'int32' #'int32')