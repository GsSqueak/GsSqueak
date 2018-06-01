misc
startRunningAll
	"Start running all scripted morphs.  Triggered by user hitting GO button"

	self presenter flushPlayerListCache.  "Inefficient, but makes sure things come right whenever GO hit"
	self presenter allExtantPlayers do: [:aPlayer | aPlayer costume residesInPartsBin ifFalse: [aPlayer startRunning]].

	self world updateStatusForAllScriptEditors