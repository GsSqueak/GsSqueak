as yet unclassified
formPressedAtKey: aSymbol
  "Answer the form for pressed button. It is automatically generated if
	unavailable."

  "(ScriptingSystem formPressedAtKey: #TryIt) asMorph openInHand"

  | pressedName pressedImage |
  pressedName := (aSymbol , 'Pressed') asSymbol.
  ((FormDictionary includesKey: aSymbol)
    and: [ (FormDictionary includesKey: pressedName) not ])
    ifTrue: [ 
      pressedImage := ((self formAtKey: aSymbol) blendColor: (Color black alpha: 0.3))
        colorReduced.
      self saveForm: pressedImage atKey: pressedName ].
  ^ self formAtKey: pressedName