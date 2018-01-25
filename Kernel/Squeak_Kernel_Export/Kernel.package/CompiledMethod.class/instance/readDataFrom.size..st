file in/out
readDataFrom: aDataStream size: varsOnDisk
	"Fill in my fields.  My header and number of literals are already installed.  Must read both objects for the literals and bytes for the bytecodes."

	self error: 'Must use readMethod'.