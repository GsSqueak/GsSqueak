e-toy support
rotationStyle: aSymbol 
	"Set my rotation style to #normal, #leftRight, #upDown, or #none.
	Styles mean:
	#normal		-- continuous 360 degree rotation
	#leftRight		-- quantize angle to left or right facing
	#upDown		-- quantize angle to up or down facing
	#none			-- do not rotate"
	rotationStyle := aSymbol.
	self layoutChanged