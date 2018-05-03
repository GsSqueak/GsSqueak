initialize
setInterpreter: anInterpreterProxy
	interpreterProxy := anInterpreterProxy.
	actualPlugin setInterpreter: anInterpreterProxy.
	"self computeSignatureMap" self flag: #FIXME "part of the oscog type inferencing"