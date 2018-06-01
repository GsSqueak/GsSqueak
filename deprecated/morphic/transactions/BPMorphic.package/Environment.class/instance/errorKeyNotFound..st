private
errorKeyNotFound: key 
	"Signal KeyNotFound error"
	^ (KeyNotFound key: key) signal