FIXME
add: ticker Synchronous: periodms Tickee: roundms
	"Declared in Cross/sqVirtualMachine but not implemented in platform support"
	<export: true>
	<var: 'ticker' type: 'void *'>
	<var: 'periodms' type: 'unsigned'> 
	<var: 'roundms' type: 'unsigned'> 
	<returnTypeC: 'sqInt'>

	"void  (*addSynchronousTickee)(void (*ticker)(void), unsigned periodms, unsigned roundms);"

	self flag: #FIXME. "remove this method when platform sources are reconciled"
	^true