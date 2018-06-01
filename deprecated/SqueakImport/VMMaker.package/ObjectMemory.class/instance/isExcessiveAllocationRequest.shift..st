allocation
isExcessiveAllocationRequest: size shift: bits

	"Answer true if size is greater than (((2 raisedTo: 31) - 1) >> bits). Used
	to limit size of allocation requests to 31 bit integer maximum to prevent
	arithmetic overflow in subsequent calculations. Always answers false
	in interpreter simulation.
	
	In the case of a 64-bit object memory running on a 64-bit host platform,
	allow larger allocation requests.

	Assumes that sizeof(int) is 4 for all platforms."

	| int32 int64 shiftCount |
	<inline: true>
	<var: #int32 type: 'int'> "32 bit signed integer"

	self isDefined: 'SQ_IMAGE64'
		inSmalltalk: [^false]
		comment: 'a 64-bit object memory word size'
		ifTrue: [self isDefined: 'SQ_HOST64'
				inSmalltalk: []
				comment: 'running on a 64-bit host platform'
				ifTrue: ["use 64 bit check if both image and host are 64 bits"
					int64 := size.
					shiftCount := 0.
					int64 < 0 ifTrue: [^ true].
					[shiftCount < bits]
						whileTrue: [int64 := int64 << 1.
							int64 < 0 ifTrue: [^ true].
							shiftCount := shiftCount +1].
					^false]
				ifFalse: ["if sqInt is 64 bit, size parameter may overflow int32"
					size > 16rFFFFFFFF ifTrue: [^false]]]
		ifFalse: ["common case of 32 bit image on either 32 or 64 bit host"
				int32 := size.
				shiftCount := 0.
				int32 < 0 ifTrue: [^ true].
				[shiftCount < bits]
					whileTrue: [int32 := int32 << 1.
						int32 < 0 ifTrue: [^ true].
						shiftCount := shiftCount +1].
				^false]
