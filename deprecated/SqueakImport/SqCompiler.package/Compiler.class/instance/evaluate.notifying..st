public access
evaluate: textOrString notifying: aController
	"See evaluate:for:notifying:. Compilation is carried out 
	with respect to nil, i.e., no object."

	^self evaluate: textOrString for: nil notifying: aController