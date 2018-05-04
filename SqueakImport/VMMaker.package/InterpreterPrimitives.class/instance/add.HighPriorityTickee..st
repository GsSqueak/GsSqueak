FIXME
add: ticker HighPriorityTickee: periodms
	"Declared in Cross/sqVirtualMachine but not implemented in platform support"
	<export: true>
	<var: 'ticker' type: 'void *'>
	<var: 'periodms' type: 'unsigned'> 
	<returnTypeC: 'sqInt'>

	"void  (*addHighPriorityTickee)(void (*ticker)(void), unsigned periodms);"

	self flag: #FIXME. "remove this method when platform sources are reconciled"
	^true