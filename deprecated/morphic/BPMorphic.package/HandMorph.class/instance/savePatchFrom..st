drawing
savePatchFrom: aCanvas 
	"Save the part of the given canvas under this hand as a Form and
	return its bounding rectangle."
	"Details: The previously used patch Form is recycled when possible to
	reduce the burden on storage management."
	| _gsSqueakTemp_damageRect _gsSqueakTemp_myBnds |
	_gsSqueakTemp_damageRect := _gsSqueakTemp_myBnds := self fullBounds.
	savedPatch
		ifNotNil: [_gsSqueakTemp_damageRect := _gsSqueakTemp_myBnds
						merge: (savedPatch offset extent: savedPatch extent)].
	(savedPatch isNil
			or: [savedPatch extent ~= _gsSqueakTemp_myBnds extent])
		ifTrue: ["allocate new patch form if needed"
			savedPatch := aCanvas form allocateForm: _gsSqueakTemp_myBnds extent].
	aCanvas
		contentsOfArea: (_gsSqueakTemp_myBnds translateBy: aCanvas origin)
		into: savedPatch.
	savedPatch offset: _gsSqueakTemp_myBnds topLeft.
	^ _gsSqueakTemp_damageRect