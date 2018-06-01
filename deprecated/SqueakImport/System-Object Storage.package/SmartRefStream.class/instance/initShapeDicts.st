read write
initShapeDicts
	"Initialize me. "

	self flag: #bobconv.	

	"These must stay constant.  When structures read in, then things can change."
	steady := {Array. Dictionary. Association. ByteString. SmallInteger. Character} asSet.

	renamed ifNil: [
		renamed := Dictionary new.  "(old class name symbol -> new class name)"
		renamedConv := Dictionary new "(oldClassNameSymbol -> conversionSelectorInNewClass)"
	].
	self initKnownRenames