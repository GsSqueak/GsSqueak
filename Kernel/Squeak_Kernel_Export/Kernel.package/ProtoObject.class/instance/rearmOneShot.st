debugging
rearmOneShot
	"Call this manually to arm the one-shot mechanism; use the mechanism in code by calling
		self doOnlyOnce: <a block>"

	Smalltalk at: #OneShotArmed put: true

	"self rearmOneShot"
