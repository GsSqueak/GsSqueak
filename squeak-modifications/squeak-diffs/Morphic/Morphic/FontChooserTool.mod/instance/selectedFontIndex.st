font list
selectedFontIndex
	| font textStyleName family |
	selectedFontIndex ifNotNil: [^selectedFontIndex].
	selectedFontIndex := 0.
	font := (getSelector isSymbol and:[target notNil])
		ifTrue:[target perform: getSelector]
		ifFalse:[getSelector].
	font ifNotNil:[
		emphasis := font emphasis.
		pointSize := font pointSize.
		textStyleName := font textStyleName.
		family := self fontList detect:[:f | f = textStyleName] ifNone:[].
	].
	selectedFontIndex := self fontList indexOf: family.
	self selectedFontIndex: selectedFontIndex.
	^selectedFontIndex