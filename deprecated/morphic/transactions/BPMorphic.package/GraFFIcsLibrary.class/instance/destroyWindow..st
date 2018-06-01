as yet unclassified
destroyWindow: aWindow
  ^ DestroyWindowCo callWith: {(aWindow cPointer)}