stepping and presenter
step
	"Perform my standard periodic action"

	super step.
	self color = self onColor
		ifTrue: [self color: (onColor alphaMixed: 0.5 with: Color black)]
		ifFalse: [self color: onColor]