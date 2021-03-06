examples
exampleColorMap
	"BitBlt exampleColorMap"
	"This example shows what one can do with the fixed part of a color
	map. The color map, as setup below, rotates the bits of a pixel all the
	way around. Thus you'll get a (sometime strange looking ;-) animation
	of colors which will end up exactly the way it looked at the beginning.
	The example is given to make you understand that the masks and
	shifts can be used for a lot more than simply color converting pixels.
	In this example, for instance, we use only two of the four independent
	shifters. "
	| cc bb |
	cc := ColorMap masks: {1 << (Display depth - 1). 1 << (Display depth - 1) - 1. 0. 0} shifts: {1 - Display depth. 1. 0. 0}.
	"mask out high bit of color component"
	"mask all other bits"
	"shift right to bottom most position"
	"shift all other pixels one bit left"
	bb := BitBlt toForm: Display.
	bb sourceForm: Display;
		 combinationRule: 3;
		 colorMap: cc.
	1
		to: Display depth
		do: [:i | 
			bb copyBits.
			Display forceDisplayUpdate]