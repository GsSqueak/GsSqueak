as yet unclassified
labelSymbol: aSymbol
  "(self labelSymbol: #TryIt) openInHand"

  | aButton form |
  aButton := ThreePhaseButtonMorph new.
  form := ScriptingSystem formAtKey: aSymbol.
  aButton offImage: form.
  aButton image: form.
  aButton pressedImage: (ScriptingSystem formPressedAtKey: aSymbol).
  ^ aButton