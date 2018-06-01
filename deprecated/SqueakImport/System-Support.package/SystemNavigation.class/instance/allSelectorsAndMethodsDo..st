query
allSelectorsAndMethodsDo: aBlock 
	"Evaluate aBlock for all selectors and methods of all behaviors in this image."
	
	self allBehaviorsDo: [ :behavior |
		behavior selectorsAndMethodsDo: [ :selector :method |
			aBlock value: behavior value: selector value: method ] ]