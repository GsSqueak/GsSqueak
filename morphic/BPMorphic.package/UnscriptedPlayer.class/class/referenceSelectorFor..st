namespace
referenceSelectorFor: anObject 
	"The use of this is for immediate evaluation of lines of script in a
	Viewer. The class inst var 'ephemeralPlayerRef' is constantly reused for
	this purpose."
	ephemeralPlayerRef := anObject.
	^ 'ephemeralPlayerRef'