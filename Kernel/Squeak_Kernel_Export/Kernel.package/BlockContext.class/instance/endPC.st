private
endPC
	"Determine end of block from long jump preceding it"
	^(self method at: startpc - 2)
				\\ 16 - 4 * 256
				+ (self method at: startpc - 1) + startpc - 1.