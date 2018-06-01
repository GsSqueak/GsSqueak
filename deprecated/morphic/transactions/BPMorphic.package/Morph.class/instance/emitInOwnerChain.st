-signals-morphic
emitInOwnerChain
	"Special kind of signals that will be handled by the owner-chain."
	| _gsSqueakTemp_signalCtx _gsSqueakTemp_signal _gsSqueakTemp_args _gsSqueakTemp_owner |
	_gsSqueakTemp_signalCtx := thisContext sender.
	_gsSqueakTemp_signal := _gsSqueakTemp_signalCtx method.
	"Extract arguments."
	_gsSqueakTemp_args := Array new: _gsSqueakTemp_signal numArgs.
	(1 to: _gsSqueakTemp_signal numArgs)
		do: [:index | _gsSqueakTemp_args
				at: index
				put: (_gsSqueakTemp_signalCtx tempAt: index)].
	"Start handling"
	_gsSqueakTemp_owner := self.
	[(_gsSqueakTemp_owner := _gsSqueakTemp_owner owner) notNil]
		whileTrue: [(_gsSqueakTemp_owner
					emitSignalInOwnerChain: _gsSqueakTemp_signal selector
					arguments: _gsSqueakTemp_args
					sender: self)
				ifTrue: [^ self"Done."]]