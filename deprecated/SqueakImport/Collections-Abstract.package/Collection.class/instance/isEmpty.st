testing
isEmpty
	"Answer whether the receiver contains any elements.
	 This implementation uses the do: block rather than
	 self size = 0 since size may be implemented in terms
	 of do:, and hence is slow for all but very small collections."

	self do: [:element | ^false].
	^true