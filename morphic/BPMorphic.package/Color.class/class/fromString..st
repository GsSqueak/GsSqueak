instance creation
fromString: aString 
	"for HTML color spec: #FFCCAA or white/black/red/other name, or an
	r,g,b triplet string"
	"Color fromString: '#FFCCAA'.
	Color fromString: 'white'.
	Color fromString: 'orange'
	Color fromString: '126,42,33'"
	| _gsSqueakTemp_aColorHex _gsSqueakTemp_rgb |
	aString isEmptyOrNil
		ifTrue: [^ self white].
	aString first = $#
		ifTrue: [_gsSqueakTemp_aColorHex := aString allButFirst]
		ifFalse: [_gsSqueakTemp_aColorHex := aString].
	"is the string a 6 digit hex number?"
	(_gsSqueakTemp_aColorHex size = 6
			and: [_gsSqueakTemp_aColorHex
					allSatisfy: [:each | '0123456789ABCDEFabcdef' includes: each]])
		ifTrue: [| green red blue |
			red := Integer
						readFrom: (_gsSqueakTemp_aColorHex first: 2)
						base: 16.
			green := Integer
						readFrom: (_gsSqueakTemp_aColorHex copyFrom: 3 to: 4)
						base: 16.
			blue := Integer
						readFrom: (_gsSqueakTemp_aColorHex last: 2)
						base: 16.
			^ self
				r: red
				g: green
				b: blue
				range: 255].
	"is the string in the form a,b,c ?"
	_gsSqueakTemp_rgb := _gsSqueakTemp_aColorHex findTokens: $,.
	_gsSqueakTemp_rgb size = 3
		ifTrue: [| green red blue |
			red := (Integer
						readFrom: (_gsSqueakTemp_rgb at: 1))
						min: 255
						max: 0.
			green := (Integer
						readFrom: (_gsSqueakTemp_rgb at: 2))
						min: 255
						max: 0.
			blue := (Integer
						readFrom: (_gsSqueakTemp_rgb at: 3))
						min: 255
						max: 0.
			^ self
				r: red
				g: green
				b: blue
				range: 255].
	"try to match aColorHex with known named colors, case insensitive"
	^ self
		perform: (ColorNames
				detect: [:colorSymbol | _gsSqueakTemp_aColorHex sameAs: colorSymbol]
				ifNone: [#white])