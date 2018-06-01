customevents-scripts-kernel
instantiatedUserScriptsDo: aBlock 
	"Evaluate aBlock on behalf of all the instantiated user scripts in the
	receiver "
	| _gsSqueakTemp_aState _gsSqueakTemp_aCostume |
	((_gsSqueakTemp_aCostume := self costume) notNil
			and: [(_gsSqueakTemp_aState := _gsSqueakTemp_aCostume actorStateOrNil) notNil])
		ifTrue: [_gsSqueakTemp_aState instantiatedUserScriptsDictionary do: aBlock]