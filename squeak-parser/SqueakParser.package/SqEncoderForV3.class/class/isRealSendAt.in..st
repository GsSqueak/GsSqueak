instruction stream support
isRealSendAt: pc in: method 
	"Answer whether the bytecode at pc is a real message-send, not
	blockCopy:."
	| byte |
	byte := method at: pc.
	^ byte >= 176
		or: ["special send or short send"
			byte >= 131
				and: [byte <= 134
						and: ["long sends"
							byte ~= 132
								or: ["double extended do anything"
									(method at: pc + 1)
										// 32 <= 1]]]]