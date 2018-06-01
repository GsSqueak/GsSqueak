testing
isRunningInBrowser: aBoolean
	"Override the automatic process.
	This should be used with caution.
	One way to determine it without using the primitive is to check for parameters typically only encountered when running as a plugin."

	RunningInBrowser := aBoolean