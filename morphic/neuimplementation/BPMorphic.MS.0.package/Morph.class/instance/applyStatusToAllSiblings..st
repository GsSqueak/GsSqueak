meta-actions
applyStatusToAllSiblings: evt 
	"Apply the statuses of all my scripts to the script status of all my
	siblings "
	| aPlayer |
	(aPlayer := self topRendererOrSelf player) belongsToUniClass
		ifFalse: [self error: 'not uniclass'].
	aPlayer
		instantiatedUserScriptsDo: [:aScriptInstantiation | aScriptInstantiation assignStatusToAllSiblings]