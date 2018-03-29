private
loadPointShortAt: index from: shortArray 
	"Load the short value from the given index in shortArray"
	^ (self cCoerce: shortArray to: 'short *')
		at: index