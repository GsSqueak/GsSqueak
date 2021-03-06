interpreter interface
loadBitBltDestForm
  "Load the dest form for BitBlt. Return false if anything is wrong, true
	otherwise. "

  <inline: true>
  | _gsSqueakTemp_destBitsSize |
  destBits := interpreterProxy fetchPointer: FormBitsIndex ofObject: destForm.
  destWidth := interpreterProxy fetchInteger: FormWidthIndex ofObject: destForm.
  destHeight := interpreterProxy
    fetchInteger: FormHeightIndex
    ofObject: destForm.
  (destWidth >= 0 and: [ destHeight >= 0 ])
    ifFalse: [ 
      self halt.
      ^ false ].
  destDepth := interpreterProxy fetchInteger: FormDepthIndex ofObject: destForm.
  destMSB := destDepth > 0.
  destDepth < 0
    ifTrue: [ destDepth := 0 - destDepth ].	"Ignore an integer bits handle for Display in which case 
	the appropriate values will be obtained by calling ioLockSurfaceBits()."
  (interpreterProxy isIntegerObject: destBits)
    ifTrue: [ 
      "Query for actual surface dimensions"
      (self queryDestSurface: (interpreterProxy integerValueOf: destBits))
        ifFalse: [ 
          self halt.
          ^ false ].
      destPPW := 32 // destDepth.
      destBits := destPitch := 0 ]
    ifFalse: [ 
      destPPW := 32 // destDepth.
      destPitch := (destWidth + (destPPW - 1)) // destPPW * 4.
      _gsSqueakTemp_destBitsSize := interpreterProxy byteSizeOf: destBits.
      ((interpreterProxy isWordsOrBytes: destBits)
        and: [ _gsSqueakTemp_destBitsSize >= (destPitch * destHeight) ])
        ifFalse: [ 
          self halt.
          ^ false ].	"Skip header since external bits don't have one"
      destBits := self
        oopForPointer: (interpreterProxy firstIndexableField: destBits) ].
  ^ true