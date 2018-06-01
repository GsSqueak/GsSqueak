editing keys
handleEmphasisExtra: index with: aKeyboardEvent 
	"Handle an extra emphasis menu item"
	| _gsSqueakTemp_action _gsSqueakTemp_attribute _gsSqueakTemp_thisSel |
	_gsSqueakTemp_action := {[_gsSqueakTemp_attribute := TextDoIt new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection]. [_gsSqueakTemp_attribute := TextPrintIt new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection]. [_gsSqueakTemp_attribute := TextLink new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection asString with: 'Comment']. [_gsSqueakTemp_attribute := TextLink new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection asString with: 'Definition']. [_gsSqueakTemp_attribute := TextLink new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection asString with: 'Hierarchy']. [_gsSqueakTemp_attribute := TextLink new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection asString]. [_gsSqueakTemp_attribute := TextURL new.
			_gsSqueakTemp_thisSel := _gsSqueakTemp_attribute analyze: self selection asString]. ["Edit hidden info"
			_gsSqueakTemp_thisSel := self hiddenInfo.
			"includes selection"
			_gsSqueakTemp_attribute := TextEmphasis normal]. ["Copy hidden info"
			self copyHiddenInfo.
			^ true]} at: index.
	"no other action"
	_gsSqueakTemp_action value.
	_gsSqueakTemp_thisSel
		ifNil: [^ true].
	"Could not figure out what to link to"
	_gsSqueakTemp_attribute
		ifNotNil: [_gsSqueakTemp_thisSel
				ifEmpty: [| oldAttributes |
					"only change emphasisHere while typing"
					oldAttributes := paragraph text attributesAt: self pointIndex.
					emphasisHere := Text addAttribute: _gsSqueakTemp_attribute toArray: oldAttributes]
				ifNotEmpty: [self
						replaceSelectionWith: (_gsSqueakTemp_thisSel asText addAttribute: _gsSqueakTemp_attribute)]].
	^ true