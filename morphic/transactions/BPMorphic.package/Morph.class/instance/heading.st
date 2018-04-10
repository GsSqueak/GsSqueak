-Etoys-geometry
heading
	"Return the receiver's heading (in eToy terms)"
	owner
		ifNil: [^ self forwardDirection].
	^ self forwardDirection + owner degreesOfFlex