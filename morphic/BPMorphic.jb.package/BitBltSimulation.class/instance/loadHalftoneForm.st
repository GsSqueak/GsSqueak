interpreter interface
loadHalftoneForm
<<<<<<< HEAD
  "Load the halftone form"

  <inline: true>
  | _gsSqueakTemp_halftoneBits |
  noHalftone
    ifTrue: [ 
      halftoneBase := nil.
      ^ true ].
  ((interpreterProxy isPointers: halftoneForm)
    and: [ (interpreterProxy slotSizeOf: halftoneForm) >= 4 ])
    ifTrue: [ 
      "Old-style 32xN monochrome halftone Forms"
      _gsSqueakTemp_halftoneBits := interpreterProxy
        fetchPointer: FormBitsIndex
        ofObject: halftoneForm.
      halftoneHeight := interpreterProxy
        fetchInteger: FormHeightIndex
        ofObject: halftoneForm.
      (interpreterProxy isWords: _gsSqueakTemp_halftoneBits)
        ifFalse: [ noHalftone := true ] ]
    ifFalse: [ 
      "New spec accepts, basically, a word array"
      ((interpreterProxy isPointers: halftoneForm) not
        and: [ interpreterProxy isWords: halftoneForm ])
        ifFalse: [ ^ false ].
      _gsSqueakTemp_halftoneBits := halftoneForm.
      halftoneHeight := interpreterProxy slotSizeOf: _gsSqueakTemp_halftoneBits ].
  halftoneBase := self
    oopForPointer:
      (interpreterProxy firstIndexableField: _gsSqueakTemp_halftoneBits).
  ^ true
=======
	"Load the halftone form"
	| _gsSqueakTemp_halftoneBits |
	<inline: true>
	noHalftone
		ifTrue: [halftoneBase := nil.
			^ true].
	((interpreterProxy isPointers: halftoneForm)
			and: [(interpreterProxy slotSizeOf: halftoneForm)
					>= 4])
		ifTrue: ["Old-style 32xN monochrome halftone Forms"
			_gsSqueakTemp_halftoneBits := interpreterProxy fetchPointer: FormBitsIndex ofObject: halftoneForm.
			halftoneHeight := interpreterProxy fetchInteger: FormHeightIndex ofObject: halftoneForm.
			(interpreterProxy isWords: _gsSqueakTemp_halftoneBits)
				ifFalse: [noHalftone := true]]
		ifFalse: ["New spec accepts, basically, a word array"
			((interpreterProxy isPointers: halftoneForm) not
					and: [interpreterProxy isWords: halftoneForm])
				ifFalse: [^ false].
			_gsSqueakTemp_halftoneBits := halftoneForm.
			halftoneHeight := interpreterProxy slotSizeOf: _gsSqueakTemp_halftoneBits].
	halftoneBase := self
				oopForPointer: (interpreterProxy firstIndexableField: _gsSqueakTemp_halftoneBits).
	^ true
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
