class initialization
initialize
	"SampledSound initialize"
	
	
	"Ensure correct initialize order during GsSqueak bootstrap"
	SoundPlayer initialize.
	

	IncrementFractionBits := 16.
	IncrementScaleFactor := 2 raisedTo: IncrementFractionBits.
	ScaledIndexOverflow := 2 raisedTo: 29.  "handle overflow before needing LargePositiveIntegers"
	self useCoffeeCupClink.
	SoundLibrary ifNil: [SoundLibrary := Dictionary new].
	Beeper setDefault: (self new
						setSamples: self coffeeCupClink
						samplingRate: 12000).
						
	FileServices registerFileReader: self
