initialization
initialCleanup
	"Images written by VMs earlier than 3.6/3.7 will wrongly have the root bit set on the active context. Besides clearing the root bit, we treat this as a marker that these images also lack a cleanup of external primitives (which has been introduced at the same time when the root bit problem was fixed). In this case, we merely flush them from here."

	((objectMemory longAt: activeContext) bitAnd: objectMemory rootBit) = 0 ifTrue:[^nil]. "root bit is clean"
	"Clean root bit of activeContext"
	objectMemory longAt: activeContext put: ((objectMemory longAt: activeContext) bitAnd: objectMemory allButRootBit).
	"Clean external primitives"
	self flushExternalPrimitives.