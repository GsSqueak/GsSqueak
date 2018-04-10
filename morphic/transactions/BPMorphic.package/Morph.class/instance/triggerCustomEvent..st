-Etoys-customevents-scripting
triggerCustomEvent: aSymbol 
	"Trigger whatever scripts may be connected to the custom event
	named aSymbol"
	self currentWorld triggerEtoyEvent: aSymbol from: self