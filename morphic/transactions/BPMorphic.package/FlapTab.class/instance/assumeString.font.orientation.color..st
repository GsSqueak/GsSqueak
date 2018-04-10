textual tabs
assumeString: aString font: aFont orientation: orientationSymbol color: aColor 
	| _gsSqueakTemp_aTextMorph _gsSqueakTemp_workString _gsSqueakTemp_tabStyle |
	labelString := aString asString.
	_gsSqueakTemp_workString := orientationSymbol == #vertical
				ifTrue: [String
						streamContents: [:s | labelString
								do: [:c | s nextPut: c]
								separatedBy: [s nextPut: Character cr]]]
				ifFalse: [labelString].
	_gsSqueakTemp_tabStyle := TextStyle new leading: 0;
				
				newFontArray: (Array with: aFont).
	_gsSqueakTemp_aTextMorph := (TextMorph new setTextStyle: _gsSqueakTemp_tabStyle)
				contents: (_gsSqueakTemp_workString asText
						addAttribute: (TextKern kern: 3)).
	self removeAllMorphs.
	self borderWidth: 2;
		 borderColor: #raised.
	aColor
		ifNotNil: [self color: aColor].
	self addMorph: _gsSqueakTemp_aTextMorph centered.
	_gsSqueakTemp_aTextMorph lock
	"
	FlapTab allSubInstancesDo: [:ft | ft reformatTextualTab
	"