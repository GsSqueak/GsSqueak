customevents-scripts-kernel
pacifyScript: aSymbol 
	"Make sure the script represented by the symbol doesn't do damage
	by lingering in related structures on the morph side"
	| _gsSqueakTemp_aUserScript |
	_gsSqueakTemp_aUserScript := self class userScriptForPlayer: self selector: aSymbol.
	_gsSqueakTemp_aUserScript
		ifNil: [self flag: #deferred.
			^ Beeper beep].
	"Maddeningly, without this line here the thing IS nil and the debugger
	is in a bad state
	(the above note dates from 1/12/99 ?!"
	self class
		allInstancesDo: [:aPlayer | 
			| itsCostume |
			aPlayer actorState instantiatedUserScriptsDictionary
				removeKey: aSymbol
				ifAbsent: [].
			itsCostume := aPlayer costume renderedMorph.
			itsCostume eventHandler
				ifNotNil: [:aHandler | aHandler forgetDispatchesTo: aSymbol].
			itsCostume removeEventTrigger: aSymbol]