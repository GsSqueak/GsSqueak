converting
adaptToScaledDecimal: rcvr andCompare: selector 
	"If I am involved in comparison with a ScaledDecimal.
	Default behaviour is to process comparison as any other selectors."
	^ self adaptToScaledDecimal: rcvr andSend: selector