e-toy support
adaptToWorld: aWorld 
	"The receiver finds itself operating in a possibly-different new world. If
	any of the receiver's parts are world-dependent (such as a target of a
	SimpleButtonMorph, etc.), then have them adapt accordingly"
	submorphs
		do: [:m | m adaptToWorld: aWorld].
	self eventHandler
		ifNotNil: [self eventHandler adaptToWorld: aWorld]