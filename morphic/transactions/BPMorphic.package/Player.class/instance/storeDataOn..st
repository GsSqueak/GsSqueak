objects from disk
storeDataOn: aDataStream 
	"Discard all non-showing script editors"
	self releaseCachedState.
	super storeDataOn: aDataStream