editing keys
changeEmphasis: aKeyboardEvent 
	"Change the emphasis of the current selection or prepare to accept
	characters with the change in emphasis. Emphasis change amounts
	to a font change. Keeps typeahead."
	"control 0..9 -> 0..9"
	| _gsSqueakTemp_keyCode _gsSqueakTemp_attribute _gsSqueakTemp_oldAttributes _gsSqueakTemp_index _gsSqueakTemp_thisSel _gsSqueakTemp_colors _gsSqueakTemp_extras |
	_gsSqueakTemp_keyCode := ('0123456789-='
				indexOf: aKeyboardEvent keyCharacter
				ifAbsent: [1])
				- 1.
	_gsSqueakTemp_oldAttributes := paragraph text attributesAt: self pointIndex.
	_gsSqueakTemp_thisSel := self selection.
	"Decipher keyCodes for Command 0-9..."
	(_gsSqueakTemp_keyCode between: 1 and: 5)
		ifTrue: [_gsSqueakTemp_attribute := TextFontChange fontNumber: _gsSqueakTemp_keyCode].
	_gsSqueakTemp_keyCode = 6
		ifTrue: [_gsSqueakTemp_colors := #(#black #magenta #red #yellow #green #blue #cyan #white ).
			_gsSqueakTemp_extras := self emphasisExtras.
			_gsSqueakTemp_index := UIManager default
						chooseFrom: _gsSqueakTemp_colors , #('choose color...' ) , _gsSqueakTemp_extras
						lines: (Array with: _gsSqueakTemp_colors size + 1).
			_gsSqueakTemp_index = 0
				ifTrue: [^ true].
			_gsSqueakTemp_index <= _gsSqueakTemp_colors size
				ifTrue: [_gsSqueakTemp_attribute := TextColor
								color: (Color
										perform: (_gsSqueakTemp_colors at: _gsSqueakTemp_index))]
				ifFalse: [_gsSqueakTemp_index := _gsSqueakTemp_index - _gsSqueakTemp_colors size - 1.
					"Re-number!!!"
					_gsSqueakTemp_index = 0
						ifTrue: [_gsSqueakTemp_attribute := self chooseColor]
						ifFalse: [^ self handleEmphasisExtra: _gsSqueakTemp_index with: aKeyboardEvent"handle an extra"]]].
	(_gsSqueakTemp_keyCode between: 7 and: 11)
		ifTrue: [aKeyboardEvent shiftPressed
				ifTrue: [_gsSqueakTemp_keyCode = 10
						ifTrue: [_gsSqueakTemp_attribute := TextKern kern: -1].
					_gsSqueakTemp_keyCode = 11
						ifTrue: [_gsSqueakTemp_attribute := TextKern kern: 1]]
				ifFalse: [_gsSqueakTemp_attribute := TextEmphasis
								perform: (#(#bold #italic #narrow #underlined #struckOut ) at: _gsSqueakTemp_keyCode - 6).
					_gsSqueakTemp_oldAttributes
						do: [:att | (att dominates: _gsSqueakTemp_attribute)
								ifTrue: [_gsSqueakTemp_attribute turnOff]]]].
	_gsSqueakTemp_keyCode = 0
		ifTrue: [_gsSqueakTemp_attribute := TextEmphasis normal].
	_gsSqueakTemp_attribute
		ifNotNil: [_gsSqueakTemp_thisSel size = 0
				ifTrue: ["only change emphasisHere while typing"
					self insertTypeAhead.
					emphasisHere := Text addAttribute: _gsSqueakTemp_attribute toArray: _gsSqueakTemp_oldAttributes]
				ifFalse: [self
						replaceSelectionWith: (_gsSqueakTemp_thisSel asText addAttribute: _gsSqueakTemp_attribute)]].
	^ true