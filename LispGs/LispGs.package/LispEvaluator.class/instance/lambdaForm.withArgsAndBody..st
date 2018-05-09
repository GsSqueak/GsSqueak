private
lambdaForm: aSymbol withArgsAndBody: aConsCell 
	"build and return the actual form representing the lambda form 
	(lambdatype (args) ... body ...)
	where lambdatype is aSymbol, either #lambda or #macro
	(args) is aConsCell car
	... (body) ... is aConsCell cdr"
	"this implementation does nothing special"
	^ ConsCell car: aSymbol cdr: aConsCell
