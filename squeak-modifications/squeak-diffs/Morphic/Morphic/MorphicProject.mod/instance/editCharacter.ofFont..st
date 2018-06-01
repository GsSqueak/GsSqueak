editors
editCharacter: character ofFont: strikeFont
	"Open a bit editor on a character in the given strike font."
	"Note that BitEditor only works in MVC currently."

	"(TextStyle default fontAt: 1) edit: $="

	self inform: 'A Morphic editor has not been implemented. Enter an MVC project to edit this font.'