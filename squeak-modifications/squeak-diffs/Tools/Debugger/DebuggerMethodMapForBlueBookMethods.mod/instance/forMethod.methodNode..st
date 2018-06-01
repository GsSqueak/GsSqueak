initialize-release
forMethod: aMethod "<CompiledMethod>" methodNode: aMethodNode "<MethodNode>"
	super forMethod: aMethod methodNode: aMethodNode.
	tempNames := methodNode encoder tempNames