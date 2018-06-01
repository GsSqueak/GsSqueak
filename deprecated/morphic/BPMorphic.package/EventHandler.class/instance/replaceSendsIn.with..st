fixups
replaceSendsIn: array1 with: array2 
	"Replace all the sends that occur in array1 with those in array2. Used
	for fixing old event handlers in files."
	| _gsSqueakTemp_old _gsSqueakTemp_index |
	1
		to: self class instSize
		do: [:i | 
			_gsSqueakTemp_old := self instVarAt: i.
			_gsSqueakTemp_index := array1 identityIndexOf: _gsSqueakTemp_old.
			_gsSqueakTemp_index > 0
				ifTrue: [self
						instVarAt: i
						put: (array2 at: _gsSqueakTemp_index)]]