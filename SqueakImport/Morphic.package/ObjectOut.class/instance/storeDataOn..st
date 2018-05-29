object storage
storeDataOn: aDataStream
	"Store myself on a DataStream. See also objectToStoreOnDataStream.
	must send 'aDataStream beginInstance:size:'"
	| cntInstVars |

	cntInstVars := self class instSize.
	"cntIndexedVars := self basicSize."
	aDataStream
		beginInstance: self xxxClass
		size: cntInstVars "+ cntIndexedVars".
	1 to: cntInstVars do:
		[:i | aDataStream nextPut: (self xxxInstVarAt: i)].
"	1 to: cntIndexedVars do:
		[:i | aDataStream nextPut: (self basicAt: i)]
"