private
stepFrom: p1 to: p2 
	"This gives p1 for stepCount = 0, moving to p2 for stepCount = nSteps"
	^ p2 - p1 * stepNumber // nSteps + p1