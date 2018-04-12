*SqBooleans-controlling
or: alternativeBlock 
	"Nonevaluating disjunction. If the receiver is false, answer the value of 
	the argument, alternativeBlock; otherwise answer true without 
	evaluating the argument."

	self @env0: or: alternativeBlock 
