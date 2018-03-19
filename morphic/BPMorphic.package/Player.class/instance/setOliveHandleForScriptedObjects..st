slot getters/setters
setOliveHandleForScriptedObjects: aBoolean 
	"Set the value of the oliveHandleForScriptedObjects preference."
	Preferences setPreference: #oliveHandleForScriptedObjects toValue: aBoolean