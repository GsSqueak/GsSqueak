error recovery
handlePrimitiveError: errorMessage
	"This method is called when the error handling results in a recursion in 
	calling on error: or halt or halt:.."

	self tryOtherProjectForRecovery: errorMessage.
	self tryEmergencyEvaluatorForRecovery: errorMessage.
	
	Project current restoreDisplay.