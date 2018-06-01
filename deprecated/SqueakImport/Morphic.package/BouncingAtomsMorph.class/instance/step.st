stepping and presenter
step
	"Bounce those atoms!"

	| r bounces |
	super step.
	bounces := 0.
	r := bounds origin corner: (bounds corner - (8@8)).
	self submorphsDo: [ :m |
		(m isMemberOf: AtomMorph) ifTrue: [
			(m bounceIn: r) ifTrue: [bounces := bounces + 1]]].
	"compute a 'temperature' that is proportional to the number of bounces
	 divided by the circumference of the enclosing rectangle"
	self updateTemperature: (10000.0 * bounces) / (r width + r height).
	transmitInfection ifTrue: [self transmitInfection].
