error handling
interactive
	"The compilation is interactive if there is a requestor and that
	requestor does either not care or explicitly allow interactive error
	correction."
	^ cue requestor notNil
		and: [(cue requestor respondsTo: #wantsInteractiveErrorCorrection) not
				or: [cue requestor perform: #wantsInteractiveErrorCorrection]]