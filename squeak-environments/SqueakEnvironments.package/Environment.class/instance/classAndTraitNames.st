classes and traits
classAndTraitNames
	| _gsSqueakTemp_names |
	_gsSqueakTemp_names := Array
				streamContents: [:out | self
						allClassesAndTraitsDo: [:value | out nextPut: value @env7: name]].
	_gsSqueakTemp_names sort.
	^ _gsSqueakTemp_names
