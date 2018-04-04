infinity behavior
testInfinityCloseTo
	"This is a test for bug http://bugs.squeak.org/view.php?id=6729:"
	
 	"FloatTest new testInfinityCloseTo"

	self deny: (Float infinity closeTo: Float negativeInfinity).
	self deny: (Float negativeInfinity closeTo: Float infinity).