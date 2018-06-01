code generation
emitCodeForLoad: stack forValue: forValue encoder: encoder 
	"If a normal literal variable (not sending value:), do nothing.
	If for value (e.g. v := Binding := expr) do nothing; the work will be
	done in emitCodeForStore:encoder:.
	If not for value then indeed load. The rest of the work will be done in
	emitCodeForStorePop:encoder:."
	(writeNode isNil
			or: [forValue])
		ifTrue: [^ self].
	encoder genPushLiteral: index.
	stack push: 1