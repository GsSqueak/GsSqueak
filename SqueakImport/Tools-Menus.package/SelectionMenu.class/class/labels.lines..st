instance creation
labels: labels lines: linesArray
	"Answer an instance of me whose items are in labels, with lines drawn  
	after each item indexed by linesArray. Labels can be either a string 
	with embedded CRs, or a collection of strings."

	(labels isString)
		ifTrue: [^ super labels: labels lines: linesArray]
		ifFalse: [^ super labelArray: labels lines: linesArray]