private
lambdaForm: aSymbol withArgsAndBody: aConsCell
  "this implementation relies on the Lisp code in library #argumentsList
	(see class-side) to redefine all supported arg list keywords (&key,
	&aux etc.) in terms of &rest and &optional only"

  ^ ConsCell car: aSymbol cdr: aConsCell