scripting access
insertContentsOf: aPlayer
	"Insert the characters from the given player at my current cursor position"

	| aLoc |
	aLoc := self cursor.
	paragraph replaceFrom: aLoc to: (aLoc - 1) with: aPlayer getStringContents displaying: true.
	self updateFromParagraph  