error correction
substituteWord: correctWord wordInterval: spot offset: o 
	"Substitute the correctSelector into the (presumed interactive)
	receiver. Update requestorOffset based on the delta size and answer
	the updated offset."
	cue requestor
		correctFrom: spot first + o
		to: spot last + o
		with: correctWord.
	requestorOffset := requestorOffset + correctWord size - spot size.
	^ o + correctWord size - spot size