private
evaluate: aBlock onBehalfOf: aProcess
	"Evaluate aBlock setting effectiveProcess to aProcess, and all other variables other than
	 the scheduling ones to those of aProcess.  Used in the execution simulation machinery
	 to ensure that Processor activeProcess evaluates correctly when debugging."
	| range savedVariables |
	"range accesses everything after myList, e.g. threadId, effectiveProcess, name, island, env"
	range := 5 to: Process instSize.
	savedVariables := range collect: [:i| self instVarAt: i].
	range do:
		[:i| self instVarAt: i put: (aProcess instVarAt: i)].
	effectiveProcess := aProcess.
	^aBlock ensure:
		["write back any assigned-to variables."
		 range do:
			[:i| | v |
			((v := self instVarAt: i) ~~ (aProcess instVarAt: i)
			 and: [v notNil]) ifTrue:
				[aProcess instVarAt: i put: v]].
		 "restore old values"
		 range with: savedVariables do:
			[:i :var| self instVarAt: i put: var]]