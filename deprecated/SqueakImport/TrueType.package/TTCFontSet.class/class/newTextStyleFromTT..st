file out/in
newTextStyleFromTT: descriptionArray

	| array f arrayOfArray |

	arrayOfArray := self pointSizes collect: [:pt |
		descriptionArray collect: [:ttc |
			ttc ifNil: [nil] ifNotNil: [
				f := (ttc size > 256)
					ifTrue: [MultiTTCFont new]
					ifFalse: [TTCFont new].
				f ttcDescription: ttc.
				f pointSize: pt.
			].
		].
	].

	array := arrayOfArray collect: [:fonts |
		self newFontArray: fonts.
	].

	^TTCFont reorganizeForNewFontArray: array name: array first familyName asSymbol.
"
	styleName := (array at: 1) familyName asSymbol.
	textStyle := TextStyle fontArray: array.
	TextConstants at: styleName put: textStyle.

	self register: array at: styleName.

	^ TextConstants at: styleName.
"