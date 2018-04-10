handles
addRecolorHandle: haloSpec 
	"Add a recolor handle to the receiver, if appropriate"
	"since this halo now opens a more general properties panel, allow it in
	all cases"
	"innerTarget canSetColor ifTrue:"
	| _gsSqueakTemp_recolorHandle |
	_gsSqueakTemp_recolorHandle := self
				addHandle: haloSpec
				on: #mouseUp
				send: #doRecolor:with:
				to: self.
	_gsSqueakTemp_recolorHandle
		on: #mouseUp
		send: #doRecolor:with:
		to: self