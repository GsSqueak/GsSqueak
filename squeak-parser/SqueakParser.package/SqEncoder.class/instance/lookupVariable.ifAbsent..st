encoding
lookupVariable: name ifAbsent: aBlock 
	"Answer the binding of name in the scope table or aBlock's vaue if
	none. Do not bind and do not lookup in pools. Used for correction,
	explanation etc"
	^ scopeTable at: name ifAbsent: aBlock