initialize
reset
	"Clean out everything"
	resourceMap := WeakValueDictionary new.
	loaded := Set new.
	unloaded := Set new.