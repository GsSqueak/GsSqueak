bytecode decoding
pushNewArrayCode
	"138 10001010 jkkkkkkk		Push (Array new: kkkkkkk) (j = 0)
	or	Pop kkkkkkk elements into: (Array new: kkkkkkk) (j = 1)"
	^ 138