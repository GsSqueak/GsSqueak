language
localeChanged
	"Set the project's natural language as indicated"
	self projectParameterAt: #localeID put: LocaleID current.
	self updateLocaleDependents