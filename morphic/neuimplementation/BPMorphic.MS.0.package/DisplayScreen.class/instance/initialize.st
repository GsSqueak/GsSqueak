as yet unclassified
initialize
  graphicsLib := CLibrary
    named:
      '$GS_HOME/shared/repos/BP2017RH1/experiments/graffics/02 SimpleDisplayInGs/sdl/libmygraphics.so'.
  createWindowCo := CCallout
    library: graphicsLib
    name: #'openWindow'
    result: #'void'
    args: #(#'int32' #'int32' #'int32' #'int32').
  drawBitmapCo := CCallout
    library: graphicsLib
    name: #'drawBitmap'
    result: #'int32'
    args: #(#'ptr' #'int32' #'int32' #'int32' #'int32')