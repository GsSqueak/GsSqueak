class initialization
removeUnreferencedPlayers
	"Remove existing but unreferenced player references"
	"StandardScriptingSystem removeUnreferencedPlayers"
	References keys do:
		[ : key | | ref |
		ref := References at: key.
		((ref respondsTo: #costume) and: [ ref costume pasteUpMorph isNil ]) ifTrue: [ References removeKey: key ] ]