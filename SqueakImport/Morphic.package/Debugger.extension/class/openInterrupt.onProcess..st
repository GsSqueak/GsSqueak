*Morphic-opening
openInterrupt: aString onProcess: interruptedProcess
	"Open a notifier in response to an interrupt. An interrupt occurs when the user types the interrupt key (cmd-. on Macs, ctrl-c or alt-. on other systems) or when the low-space watcher detects that memory is low."
	| debugger |
	<primitive: 19> "Simulation guard"
	debugger := self new.
	debugger
		process: interruptedProcess
		controller: (ScheduledControllers
				ifNotNil: [:sc | 
					"this means we are in an MVC project"
					sc inActiveControllerProcess == interruptedProcess
						ifTrue: [ScheduledControllers activeController]])
		context: interruptedProcess suspendedContext.
	debugger externalInterrupt: true.

	Preferences logDebuggerStackToFile ifTrue:
		[(aString includesSubstring: 'Space') & (aString includesSubstring: 'low')
			ifTrue: [Smalltalk logError: aString inContext: debugger interruptedContext to: 'LowSpaceDebug.log']
			"logging disabled for 4.3 release, see
				http://lists.squeak.org/pipermail/squeak-dev/2011-December/162503.html"
			"ifFalse: [Smalltalk logSqueakError: aString inContext: debugger interruptedContext]"].

	Preferences eToyFriendly ifTrue: [Project current world stopRunningAll].
	^debugger
		openNotifierContents: nil label: aString;
		yourself
