accessing
methodClass: aClass
	"For now, we don't support changing a CompiledMethod's class in GsSqueak"
	self assert: inClass == aClass
