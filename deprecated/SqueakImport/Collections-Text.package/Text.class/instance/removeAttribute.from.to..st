emphasis
removeAttribute: att from: start to: stop 
	"Remove the attribute over the interval start to stop."
	runs :=  runs copyReplaceFrom: start to: stop
			with: ((runs copyFrom: start to: stop)
				mapValues:
				[:attributes | attributes copyWithout: att])
