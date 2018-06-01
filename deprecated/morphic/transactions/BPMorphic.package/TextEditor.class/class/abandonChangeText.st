class initialization
abandonChangeText
	"Call this to get out of the maddening situation in which the system
	keeps aggressively trying to do a replacement that you no longer wish
	to make, every time you make choose a new method in a list."
	ChangeText := FindText
	"
	TextEditor abandonChangeText
	"