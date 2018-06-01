color manipulation
colorsUsed
	"Return a list of the colors actually used by this ColorForm."
	| _gsSqueakTemp_myColor _gsSqueakTemp_list |
	_gsSqueakTemp_myColor := self colors.
	_gsSqueakTemp_list := OrderedCollection new.
	self tallyPixelValues
		doWithIndex: [:count :i | count > 0
				ifTrue: [_gsSqueakTemp_list
						add: (_gsSqueakTemp_myColor at: i)]].
	^ _gsSqueakTemp_list asArray