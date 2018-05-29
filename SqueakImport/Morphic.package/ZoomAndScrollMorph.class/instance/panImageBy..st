as yet unclassified
panImageBy: pixels

	self changeOffsetBy: (pixels * self getTiltFactor * 0.1) @ 0.

	"steps := (pixels abs / 6) exp rounded * pixels sign."
"==Alan's preferred factors
pan = 0.0425531914893617
zoom = 0.099290780141844
==="

