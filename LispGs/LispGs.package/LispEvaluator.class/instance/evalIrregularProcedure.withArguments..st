private
evalIrregularProcedure: aWouldBeProcedure withArguments: aConsCell 
	"subclasses may consider any object as a procedure and handle its
	evaluation here"
	self evalList: aConsCell.
	"this allows a continuation jump from the arguments evaluation.

	http://groups.google.com/groups?selm=87g00y4b6l.fsf%40radish.petrofsky.org "
	self lispError: 'Invalid function: ' , aWouldBeProcedure asString
