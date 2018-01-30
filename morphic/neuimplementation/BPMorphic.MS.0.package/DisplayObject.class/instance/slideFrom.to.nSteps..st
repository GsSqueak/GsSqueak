displaying-Display
slideFrom: startPoint to: stopPoint nSteps: nSteps 
	"does not display at the first point, but does at the last"
	| i p delta |
	i := 0.
	p := startPoint.
	delta := stopPoint - startPoint // nSteps.
	^ self
		follow: [(p := p + delta) truncated]
		while: [(i := i + 1) < nSteps]