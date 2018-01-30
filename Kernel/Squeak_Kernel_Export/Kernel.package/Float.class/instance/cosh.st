mathematical functions
cosh
	"Answer receivers hyperbolic cosine."
	
	| ex |
	ex := self abs exp.
	^(ex + ex reciprocal) / 2