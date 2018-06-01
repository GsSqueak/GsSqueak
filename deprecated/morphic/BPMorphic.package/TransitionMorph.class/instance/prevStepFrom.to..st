private
prevStepFrom: p1 to: p2 
	"Used for recalling dimensions from previous step."
	^ p2 - p1 * (stepNumber - 1) // nSteps + p1