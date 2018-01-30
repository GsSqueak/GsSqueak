signaling
signal
	"Call only from #notYetImplemented.  Find the context that sent #nYI... this is the method that needs to be implemented."
	| ctxt ex |
	ctxt := thisContext sender sender.
	ex := self new.
	ex receiverClass: ctxt receiver class selector: ctxt selector.
	ex messageText: ctxt printString.
	ex signal.
		