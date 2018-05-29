shrinking
presumedSentMessages   | sent |
"Smalltalk presumedSentMessages"

	"The following should be preserved for doIts, etc"
	sent := IdentitySet new.
	#(compactSymbolTable rebuildAllProjects
		browseAllSelect:  lastRemoval
		scrollBarValue: vScrollBarValue: scrollBarMenuButtonPressed: 
		withSelectionFrom:  to: removeClassNamed:
		dragon: hilberts: mandala: web test3 factorial tinyBenchmarks benchFib
		newDepth: restoreAfter: zapAllMethods obsoleteClasses
		removeAllUnSentMessages abandonSources removeUnreferencedKeys
		reclaimDependents zapOrganization condenseChanges browseObsoleteReferences
		subclass:instanceVariableNames:classVariableNames:poolDictionaries:category:
		methodsFor:stamp: methodsFor:stamp:prior: instanceVariableNames:
		unusedClasses) do:
		[:sel | sent add: sel].
	"The following may be sent by perform: in dispatchOnChar..."
	Smalltalk at: #ParagraphEditor ifPresent: [:paragraphEditor |
		(paragraphEditor classPool at: #CmdActions) asSet do:
			[:sel | sent add: sel].
		(paragraphEditor classPool at: #ShiftCmdActions) asSet do:
			[:sel | sent add: sel]].
	^ sent
