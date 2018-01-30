private
setDefaultContentsIfNil
	"Set the default contents"
	| _gsSqueakTemp_toUse |
	text
		ifNil: [_gsSqueakTemp_toUse := self valueOfProperty: #defaultContents.
			_gsSqueakTemp_toUse
				ifNil: [_gsSqueakTemp_toUse := 'abc' asText
					"allBold"].
			"try it plain for a while"
			text := _gsSqueakTemp_toUse]