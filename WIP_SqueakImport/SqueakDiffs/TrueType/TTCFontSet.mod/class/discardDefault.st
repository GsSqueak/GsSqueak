private
discardDefault
"
	self discardDefault
"
	| ttc |
	ttc := TTCFontDescription default.
	ttc ifNotNil: [
		TextConstants removeKey: ttc name asSymbol ifAbsent: [].
	].