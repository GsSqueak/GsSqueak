editing keys
changeEmphasis: aKeyboardEvent 
	"Change the emphasis of the current selection or prepare to accept characters with the change in emphasis. Emphasis change amounts to a font change.  Keeps typeahead."

	"control 0..9 -> 0..9"

	| keyCode attribute oldAttributes index thisSel colors extras |
	keyCode := ('0123456789-=' indexOf: aKeyboardEvent keyCharacter ifAbsent: [1]) - 1.
	oldAttributes := paragraph text attributesAt: self pointIndex.
	thisSel := self selection.

	"Decipher keyCodes for Command 0-9..."
	(keyCode between: 1 and: 5) 
		ifTrue: [attribute := TextFontChange fontNumber: keyCode].

	keyCode = 6 
		ifTrue: [
			colors := #(#black #magenta #red #yellow #green #blue #cyan #white).
			extras := self emphasisExtras.
			index := UIManager default chooseFrom:colors , #('choose color...' ), extras
						lines: (Array with: colors size + 1).
			index = 0 ifTrue: [^true].
			index <= colors size 
				ifTrue: [attribute := TextColor color: (Color perform: (colors at: index))]
				ifFalse: [
					index := index - colors size - 1.	"Re-number!!!"
					index = 0 
						ifTrue: [attribute := self chooseColor]
						ifFalse:[^self handleEmphasisExtra: index with: aKeyboardEvent]	"handle an extra"]].
	(keyCode between: 7 and: 11) 
		ifTrue: [
			aKeyboardEvent shiftPressed 
				ifTrue: [
					keyCode = 10 ifTrue: [attribute := TextKern kern: -1].
					keyCode = 11 ifTrue: [attribute := TextKern kern: 1]]
				ifFalse: [
					attribute := TextEmphasis 
								perform: (#(#bold #italic #narrow #underlined #struckOut) at: keyCode - 6).
					oldAttributes 
						do: [:att | (att dominates: attribute) ifTrue: [attribute turnOff]]]].
	keyCode = 0 ifTrue: [attribute := TextEmphasis normal].
	attribute ifNotNil: [
		thisSel size = 0
			ifTrue: [
				"only change emphasisHere while typing"
				self insertTypeAhead.
				emphasisHere := Text addAttribute: attribute toArray: oldAttributes ]
			ifFalse: [
				self replaceSelectionWith: (thisSel asText addAttribute: attribute) ]].
	^true