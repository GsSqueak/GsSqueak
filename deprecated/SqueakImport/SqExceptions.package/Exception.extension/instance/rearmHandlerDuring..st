*SqExceptions-handling
rearmHandlerDuring: aBlock
"Make the current error handler re-entrant while it is running aBlock. Only works in a closure-enabled image"
	self shouldNotImplement.
	"^ handlerContext rearmHandlerDuring: aBlock"
