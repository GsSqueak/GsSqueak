mime file in/out
replaceStyle: oldStyle with: newStyle 
	"
	TextStyle replaceStyle: (TextStyle named: #AccunyOLD) with:
	(TextStyle named: #Accuny)
	"
	"Try to find corresponding fonts in newStyle and substitute the fonts in
	oldStyle for them."
	| _gsSqueakTemp_oldKeys |
	_gsSqueakTemp_oldKeys := Set new.
	TextConstants
		keysAndValuesDo: [:k :v | v = oldStyle
				ifTrue: [_gsSqueakTemp_oldKeys add: k]].
	_gsSqueakTemp_oldKeys removeAllFoundIn: self defaultFamilyNames.
	self replaceFontsIn: oldStyle fontArray with: newStyle.
	oldStyle becomeForward: newStyle.
	_gsSqueakTemp_oldKeys
		do: [:k | TextConstants removeKey: k]