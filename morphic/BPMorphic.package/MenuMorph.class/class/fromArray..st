instance creation
fromArray: anArray 
	"Construct a menu from anArray. The elements of anArray 
	must be either: 
	* A pair of the form: <label> <selector> 
	or	* The 'dash' (or 'minus sign') symbol 
	
	Refer to the example at the bottom of the method"
	| _gsSqueakTemp_menu |
	_gsSqueakTemp_menu := self new.
	anArray
		do: [:anElement | anElement size = 1
				ifTrue: [anElement == #-
						ifFalse: [^ self error: 'badly-formed menu constructor'].
					_gsSqueakTemp_menu addLine]
				ifFalse: [anElement size = 2
						ifFalse: [^ self error: 'badly-formed menu constructor'].
					_gsSqueakTemp_menu add: anElement first action: anElement second]].
	^ _gsSqueakTemp_menu