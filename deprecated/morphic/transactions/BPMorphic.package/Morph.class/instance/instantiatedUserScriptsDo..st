-Etoys-customevents-scripting
instantiatedUserScriptsDo: aBlock 
	self actorStateOrNil
		ifNotNil: [:aState | aState instantiatedUserScriptsDictionary do: aBlock]