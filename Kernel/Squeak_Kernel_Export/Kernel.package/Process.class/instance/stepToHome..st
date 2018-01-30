changing suspended state
stepToHome: aContext 
	"Resume self until the home of top context is aContext.  Top context may be a block context.
	 Catch any UnhandledErrors that are created while stepping, answering the relevant signalerContext
	 if so. Note that this will cause weird effects if using through to step through UnhandledError
	 code, but as the doctor ordered, don't do that; use over or into instead."

	^Processor activeProcess
		evaluate:
			[| home anError |
			home := aContext home.
			[suspendedContext := suspendedContext step.
			 home == suspendedContext home or: [home isDead]] whileFalse:
				[(suspendedContext selector == #signalForException:
				 and: [(suspendedContext receiver isBehavior and: [
						suspendedContext receiver includesBehavior: UnhandledError])
				 and: [anError := suspendedContext tempAt: 1.
					   ((suspendedContext objectClass: anError) includesBehavior: Exception)
				 and: [anError canSearchForSignalerContext]]]) ifTrue:
					[anError signalerContext ifNotNil:
						[:unhandledErrorSignalerContext|
						[unhandledErrorSignalerContext == suspendedContext] whileFalse:
							[self completeStep: suspendedContext].
						"Give a debugger a chance to update its title to reflect the new exception"
						 Notification new
							tag: {unhandledErrorSignalerContext. anError};
							signal.
						^unhandledErrorSignalerContext]]].
			suspendedContext]
		onBehalfOf: self