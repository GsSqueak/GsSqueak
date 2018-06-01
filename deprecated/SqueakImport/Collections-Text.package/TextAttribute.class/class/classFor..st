fileIn/Out
classFor: scanCharacter
	"Answer the class that uses scanCharacter to identify itself in a text fileout" 
	^ self allSubclasses detect: [:cls | cls scanCharacters includes: scanCharacter]
