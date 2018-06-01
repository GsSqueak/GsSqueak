-Etoys-card in a stack
installAsCurrent: anInstance 
	"Install anInstance as the one currently viewed in the receiver. Dock
	up all the morphs in the receiver which contain data rooted in the
	player instance to the instance data. Run any 'opening' scripts that
	pertain. "
	| _gsSqueakTemp_fieldList |
	self player == anInstance
		ifTrue: [^ self].
	_gsSqueakTemp_fieldList := self allMorphs
				select: [:aMorph | aMorph wouldAcceptKeyboardFocusUponTab
						and: [aMorph isLocked not]].
	self currentWorld hands
		do: [:aHand | | itsFocus | (itsFocus := aHand keyboardFocus) notNil
				ifTrue: [(_gsSqueakTemp_fieldList includes: itsFocus)
						ifTrue: [aHand newKeyboardFocus: nil]]].
	self player uninstallFrom: self.
	"out with the old"
	anInstance installPrivateMorphsInto: self.
	self changed.
	anInstance costume: self.
	self player: anInstance.
	self player class variableDocks
		do: [:aVariableDock | aVariableDock dockMorphUpToInstance: anInstance].
	self currentWorld startSteppingSubmorphsOf: self