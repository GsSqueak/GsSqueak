editing keys
handleEmphasisExtra: index with: aKeyboardEvent
	"Handle an extra emphasis menu item"
	| action attribute thisSel |
	action := {
		[attribute := TextDoIt new.
		thisSel := attribute analyze: self selection].
		[attribute := TextPrintIt new.
		thisSel := attribute analyze: self selection].
		[attribute := TextLink new.
		thisSel := attribute analyze: self selection asString with: 'Comment'].
		[attribute := TextLink new.
		thisSel := attribute analyze: self selection asString with: 'Definition'].
		[attribute := TextLink new.
		thisSel := attribute analyze: self selection asString with: 'Hierarchy'].
		[attribute := TextLink new.
		thisSel := attribute analyze: self selection asString].
		[attribute := TextURL new.
		thisSel := attribute analyze: self selection asString].
		["Edit hidden info"
		thisSel := self hiddenInfo.	"includes selection"
		attribute := TextEmphasis normal].
		["Copy hidden info"
		self copyHiddenInfo.
		^true].	"no other action"
	} at: index.
	action value.

	thisSel ifNil: [^true].	"Could not figure out what to link to"

	attribute ifNotNil: [
		thisSel ifEmpty:[ | oldAttributes |
			"only change emphasisHere while typing"
			oldAttributes := paragraph text attributesAt: self pointIndex.
			emphasisHere := Text addAttribute: attribute toArray: oldAttributes.
		] ifNotEmpty: [
			self replaceSelectionWith: (thisSel asText addAttribute: attribute).
		]
	].
	^true