editing keys
hiddenInfo
	"In TextLinks, TextDoits, TextColor, and TextURLs, there is hidden info.
	Return the entire string that was used by Cmd-6 to create this text
	attribute. Usually enclosed in < >."
	| _gsSqueakTemp_attrList |
	_gsSqueakTemp_attrList := self text attributesAt: self pointIndex + self markIndex // 2.
	_gsSqueakTemp_attrList
		do: [:attr | (attr isKindOf: TextAction)
				ifTrue: [^ self selection asString , '<' , attr info , '>']].
	"If none of the above"
	_gsSqueakTemp_attrList
		do: [:attr | attr class == TextColor
				ifTrue: [^ self selection asString , '<' , attr color printString , '>']].
	^ self selection asString , '[No hidden info]'