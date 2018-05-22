debugging
debugMethod: aCompiledMethod forReceiver: anObject inContext: aContextOrNil

	| guineaPig debugger debuggerWindow context |
	guineaPig :=
		[aCompiledMethod
			valueWithReceiver: anObject
			 arguments: (aContextOrNil ifNil: [ #() ] ifNotNil: [ { aContextOrNil } ]).
		 guineaPig := nil "spot the return from aCompiledMethod"] newProcess.
	context := guineaPig suspendedContext.
	debugger := Debugger new
		process: guineaPig
		controller: nil
		context: context.
	debuggerWindow := debugger openFullNoSuspendLabel: 'Debug it'.
	"Now step into the expression.  But if it is quick (is implemented as a primtiive, e.g. `0')
	 it will return immediately back to the block that is sent newProcess above.  Guard
	 against that with the check for home being thisContext."
	[debugger interruptedContext method == aCompiledMethod]
		whileFalse:
			[(guineaPig isNil
			  and: [debugger interruptedContext home == thisContext]) ifTrue:
				[debuggerWindow delete.
				 UIManager default inform: 'Nothing to debug; expression is optimized'.
				 ^self].
			debugger send]