translation
mustBeGlobal: var
	"Answer if a variable must be global and exported.  Used for inst vars that are accessed from VM support code."

	^(self objectMemoryClass mustBeGlobal: var)
	   or: [#('interpreterProxy' 'interpreterVersion' 'inIOProcessEvents'
			'deferDisplayUpdates' 'extraVMMemory' 'showSurfaceFn'
			'desiredNumStackPages' 'desiredEdenBytes'
			'breakSelector' 'breakSelectorLength' 'sendTrace'
			'suppressHeartbeatFlag') includes: var]