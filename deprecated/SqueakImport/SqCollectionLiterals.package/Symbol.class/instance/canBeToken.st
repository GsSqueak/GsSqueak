testing
canBeToken
	"Since definition of #tokenish depends on a preference, we want to make sure
	that underscores are always considered tokenish. This is so that selectors created
	when the preference was turned on don't suddenly become invalid when the
	preference is turned off."
	
	^ self allSatisfy: [:c | c = $_ or: [c tokenish]]