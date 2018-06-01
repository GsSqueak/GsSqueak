initialize
initialize
	| fd pvt |
	originalMap := IdentityDictionary new.
	stubMap := IdentityDictionary new.
	locatorMap := IdentityDictionary new.
	internalStubs := IdentityDictionary new.
	fd := ScriptingSystem formDictionary.
	pvt := ScriptingSystem privateGraphics asSet.
	fd keysAndValuesDo:[:sel :form|
		(pvt includes: sel) ifFalse:[
			internalStubs at: form put:
				(DiskProxy 
					global: #ScriptingSystem
					selector: #formAtKey:extent:depth:
					args: {sel. form extent. form depth})]].