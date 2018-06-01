file in/out
storeHtmlPageIn: aFileDirectory
	"Prepare the HTML wrapper for the current project"
	| file page |
	file := aFileDirectory forceNewFileNamed: (self name, FileDirectory dot,'html').
	file ifNil: [^self].
	file converter: UTF8TextConverter new.
	page := self htmlPagePrototype.
	page := page copyReplaceAll: '$$PROJECT$$' with: self versionedFileName.
	page := page copyReplaceAll: '$$WIDTH$$' with: world bounds width printString.
	page := page copyReplaceAll: '$$HEIGHT$$' with: world bounds height printString.
	page := page copyReplaceAll: String cr with: String lf. "not sure if necessary..."
	file nextPutAll: page.
	file close.