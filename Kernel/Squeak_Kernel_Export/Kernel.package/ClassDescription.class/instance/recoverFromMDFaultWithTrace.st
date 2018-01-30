accessing method dictionary
recoverFromMDFaultWithTrace
	"This method handles emthodDict faults to support, eg, discoverActiveClasses (qv)."
	self recoverFromMDFault.
	self environment at: #MDFaultDict ifPresent:
		[:faultDict | faultDict at: self name put:
			(String streamContents:
				[:strm | (thisContext stackOfSize: 20) do: [:item | strm print: item; cr]])]

"Execute the following statement to induce MD fault tracing.  This means that, not only will all active classes be recorded but, after a test run, MDFaultDict will contain, for every class used, a stack trace showing how it came to be used.  This statement should be executed just prior to any such text, in order to clear the traces.

	Smalltalk at: #MDFaultDict put: Dictionary new.

"