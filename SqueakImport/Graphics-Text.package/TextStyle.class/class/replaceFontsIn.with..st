mime file in/out
replaceFontsIn: oldFontArray with: newStyle
	"
	TextStyle replaceFontsIn: (TextStyle looseFontsFromFamily: #Accuny) with: (TextStyle named: #Accuny)
	"
	"Try to find corresponding fonts in newStyle and substitute them for the fonts in oldFontArray"

	newStyle fontArray do: [ :newFont2 | newFont2 releaseCachedState ].

	oldFontArray do: [ :oldFont | | newFont |
		oldFont reset.
		newFont := (newStyle fontOfPointSize: oldFont pointSize) emphasis: oldFont emphasis.
		oldFont becomeForward: newFont ].

	Smalltalk at: #StringMorph ifPresent:[:cls| cls allSubInstancesDo: [ :s | s layoutChanged]].
	Smalltalk at: #TextMorph ifPresent:[:cls| cls allSubInstancesDo: [ :s | s layoutChanged]].
	Smalltalk at: #SystemWindow ifPresent:[:cls| 
		cls allInstancesDo: [ :w | [ w update: #relabel ] on: Error do: [ :ex | ] ]].
	Project current world ifNotNil: [ :w | w changed ].
