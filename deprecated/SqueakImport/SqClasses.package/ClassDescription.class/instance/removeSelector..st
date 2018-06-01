*SqClasses-accessing method dictionary
removeSelector: selector 
	"Remove the message whose selector is given from the method 
	dictionary of the receiver, if it is there. Answer nil otherwise."

	| priorMethod priorProtocol | 
	priorMethod := self compiledMethodAt: selector ifAbsent: [^ nil].
	priorProtocol := self whichCategoryIncludesSelector: selector.

	SystemChangeNotifier uniqueInstance doSilently: [
		self organization removeElement: selector].

	super removeSelector: selector.

	SystemChangeNotifier uniqueInstance 
			methodRemoved: priorMethod selector: selector inProtocol: priorProtocol class: self.
