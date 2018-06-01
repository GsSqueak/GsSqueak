handles
addScriptHandle: haloSpec
	"If the halo's innerTarget claims it wants a Script handle, add one to the receiver, forming it as per haloSpec"

	innerTarget wantsScriptorHaloHandle ifTrue:
		[self addHandle: haloSpec
				on: #mouseUp send: #editButtonsScript to: innerTarget]
