class initialization
initialize
	"VMBasicConstants initialize"

	DoExpensiveAssertionChecks ifNil: [DoExpensiveAssertionChecks := false].
