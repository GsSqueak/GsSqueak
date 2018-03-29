finalization
fireEphemeron: ephemeron 
	objectMemory queueMourner: ephemeron;
		 setFormatOf: ephemeron to: objectMemory nonIndexablePointerFormat.
	self signalFinalization: ephemeron