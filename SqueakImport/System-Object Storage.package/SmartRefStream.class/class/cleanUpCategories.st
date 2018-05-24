initialize-release
cleanUpCategories
	| list valid removed |
	"Look for all conversion methods that can't be used any longer.  Delete them."
	" SmartRefStream cleanUpCategories "

	"Two part selectors that begin with convert and end with a digit."
	"convertasossfe0: varDict asossfeu0: smartRefStrm"
	list := Symbol selectorsContaining: 'convert'.
	list := list select: [:symb | (symb beginsWith: 'convert') & (symb allButLast last isDigit)
				ifTrue: [(symb numArgs = 2)]
				ifFalse: [false]].
	valid := 0.  removed := 0.
	list do: [:symb |
		(self systemNavigation allClassesImplementing: symb) do: [:newClass | | newList newVers |
			newList := (Array with: newClass classVersion), (newClass allInstVarNames).
			newVers := self new versionSymbol: newList.
			(symb endsWith: (':',newVers,':')) 
				ifFalse: [
					"method is useless because can't convert to current shape"
					newClass removeSelector: symb.	"get rid of it"
					removed := removed + 1]
				ifTrue: [valid := valid + 1]]].
	Transcript cr; show: 'Removed: '; print: removed; 
		show: '		Kept: '; print: valid; show: ' '.