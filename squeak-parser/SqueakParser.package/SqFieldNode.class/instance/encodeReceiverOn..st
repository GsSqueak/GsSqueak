code generation
encodeReceiverOn: encoder 
	"encode the receiver node"
	rcvrNode := encoder encodeVariable: 'self'