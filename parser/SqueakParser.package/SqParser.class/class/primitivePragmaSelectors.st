accessing
primitivePragmaSelectors
	"Answer the selectors of pragmas that specify VM primitives.
	Needed for compile and decomple."
	^ #(#primitive: #primitive:error: #primitive:error:module: #primitive:module: #primitive:module:error:)