primitive support
isMetaPrimitiveIndex: primIndex 
	"This virtual machine provides two primitives that executes arbitrary
	primitives, one
	for indexed primitivces and one for named primitives. These meta
	primitives are used
	in the debugger to execute primitives while simulating execution.
	Spur needs to know
	the accessor depth for a primitive so that failures due to forwarders
	can be fixed up
	and retried. This method identifies such meta primitives so that
	metaAccessorDepth can be substituted when appropriate."
	^ primIndex = PrimNumberDoPrimitive
		or: [primIndex = PrimNumberDoExternalCall]