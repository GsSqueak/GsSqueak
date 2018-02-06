as yet unclassified
initialize
  GraphicsLib := CLibrary named: '/opt/libmygraphics.so'.
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
    args: #(#'ptr')