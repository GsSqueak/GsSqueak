enumerating
select: selectBlock thenDo: doBlock 
	"Utility method to improve readability."
	^ (self select: selectBlock) do: doBlock