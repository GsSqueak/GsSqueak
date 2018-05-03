class initialization
initialize
	"30-bit MT521 parameters. generated with a modified version of dcmt with ID=1. http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/DC/dc.html"

	"Base parameters"
	"MTp := 521. Not used directly."
	MTw := 30.
	MTm := 9.
	MTa := 16r3235DEE2.
	"MTb := 16r39BB2B00. Not used directly."
	"MTc := 16r3EFD0000. Not used directly."
	MTl := -18.
	MTu := -12.
	MTs := 7.
	MTt := 15.
	"Calculated parameters"
	MTn := 18.
	"MTr := 19. Not used directly."
	MTupperMask := 16r3FF80000.
	MTlowerMask := 16r7FFFF.
	MTwordMask := 16r3FFFFFFF.
	MTbShifted := 7566934.
	MTcShifted := 32250.
	MTwFloatMultiplier := 8388608