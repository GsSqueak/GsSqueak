start & finish
afterNewPicDo: goodBlock ifNoBits: badBlock
	"If the user said 'Save' at the end of drawing, do this block to save the picture.
goodBlock takes 2 args, the painted form and the bounding rectangle of its bits.
badBlock takes no args.  "

	newPicBlock := goodBlock.
	emptyPicBlock := badBlock.