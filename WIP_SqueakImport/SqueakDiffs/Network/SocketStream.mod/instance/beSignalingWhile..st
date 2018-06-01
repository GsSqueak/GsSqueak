private
beSignalingWhile: aBlock
	"Temporarily turn a non-signaling SocketStream into a signaling one.
	Required for some of operations that will catch ConnectionClosed in 
	order to find out that an operation completed"

	| signaling |
	signaling := shouldSignal.
	shouldSignal := true.
	^aBlock ensure:[shouldSignal := signaling]
