as yet unclassified
initialize
  GraphicsLib := CLibrary
    named:
      '/home/jakob/Studium/bp/BP2017RH1/experiments/graffics/02 SimpleDisplayInGs/sdl/libmygraphics.so'.
  CreateWindowCo := CCallout
    library: GraphicsLib
    name: #'openWindow'
    result: #'void'
    args: #(#'int32' #'int32' #'int32' #'int32').
  DrawBitmapCo := CCallout
    library: GraphicsLib
    name: #'drawBitmap'
    result: #'int32'
    args: #(#'ptr' #'int32' #'int32' #'int32' #'int32')