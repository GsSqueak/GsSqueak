initialization
initializeBytecodeTableForSistaV1
	"See e.g. the cass comment for EncoderForSistaV1"
	"StackInterpreter initializeBytecodeTableForSistaV1"
	"Note: This table will be used to generate a C switch statement."
	initializationOptions at: #SistaV1BytecodeSet put: (SistaV1BytecodeSet := true).
	BytecodeTable := Array new: 256.
	BytecodeEncoderClassName := #EncoderForSistaV1.
	BytecodeSetHasDirectedSuperSend := true.
	BytecodeSetHasExtensions := true.
	LongStoreBytecode := 245.
	self table: BytecodeTable from: #(#(0 15 #pushReceiverVariableBytecode) #(16 31 #pushLiteralVariable16CasesBytecode) #(32 63 #pushLiteralConstantBytecode) #(64 75 #pushTemporaryVariableBytecode) #(76 #pushReceiverBytecode) #(77 #pushConstantTrueBytecode) #(78 #pushConstantFalseBytecode) #(79 #pushConstantNilBytecode) #(80 #pushConstantZeroBytecode) #(81 #pushConstantOneBytecode) #(82 #extPushPseudoVariable) #(83 #duplicateTopBytecode) #(84 87 #unknownBytecode) #(88 #returnReceiver) #(89 #returnTrue) #(90 #returnFalse) #(91 #returnNil) #(92 #returnTopFromMethod) #(93 #returnNilFromBlock) #(94 #returnTopFromBlock) #(95 #extNopBytecode) #(96 #bytecodePrimAdd) #(97 #bytecodePrimSubtract) #(98 #bytecodePrimLessThanSistaV1) #(99 #bytecodePrimGreaterThanSistaV1) #(100 #bytecodePrimLessOrEqualSistaV1) #(101 #bytecodePrimGreaterOrEqualSistaV1) #(102 #bytecodePrimEqualSistaV1) #(103 #bytecodePrimNotEqualSistaV1) #(104 #bytecodePrimMultiply) #(105 #bytecodePrimDivide) #(106 #bytecodePrimMod) #(107 #bytecodePrimMakePoint) #(108 #bytecodePrimBitShift) #(109 #bytecodePrimDiv) #(110 #bytecodePrimBitAnd) #(111 #bytecodePrimBitOr) #(112 #bytecodePrimAt) #(113 #bytecodePrimAtPut) #(114 #bytecodePrimSize) #(115 #bytecodePrimNext) #(116 #bytecodePrimNextPut) #(117 #bytecodePrimAtEnd) #(118 #bytecodePrimIdenticalSistaV1) #(119 #bytecodePrimClass) #(120 #bytecodePrimNotIdenticalSistaV1) #(121 #bytecodePrimValue) #(122 #bytecodePrimValueWithArg) #(123 #bytecodePrimDo) #(124 #bytecodePrimNew) #(125 #bytecodePrimNewWithArg) #(126 #bytecodePrimPointX) #(127 #bytecodePrimPointY) #(128 143 #sendLiteralSelector0ArgsBytecode) #(144 159 #sendLiteralSelector1ArgBytecode) #(160 175 #sendLiteralSelector2ArgsBytecode) #(176 183 #shortUnconditionalJump) #(184 191 #shortConditionalJumpTrue) #(192 199 #shortConditionalJumpFalse) #(200 207 #storeAndPopReceiverVariableBytecode) #(208 215 #storeAndPopTemporaryVariableBytecode) #(216 #popStackBytecode) #(217 #unconditionnalTrapBytecode) #(218 223 #unknownBytecode) #(224 #extABytecode) #(225 #extBBytecode) #(226 #extPushReceiverVariableBytecode) #(227 #extPushLiteralVariableBytecode) #(228 #extPushLiteralBytecode) #(229 #longPushTemporaryVariableBytecode) #(230 #unknownBytecode) #(231 #pushNewArrayBytecode) #(232 #extPushIntegerBytecode) #(233 #extPushCharacterBytecode) #(234 #extSendBytecode) #(235 #extSendSuperBytecode) #(236 #callMappedInlinedPrimitive) #(237 #extUnconditionalJump) #(238 #extJumpIfTrue) #(239 #extJumpIfFalse) #(240 #extStoreAndPopReceiverVariableBytecode) #(241 #extStoreAndPopLiteralVariableBytecode) #(242 #longStoreAndPopTemporaryVariableBytecode) #(243 #extStoreReceiverVariableBytecode) #(244 #extStoreLiteralVariableBytecode) #(245 #longStoreTemporaryVariableBytecode) #(246 247 #unknownBytecode) #(248 #callPrimitiveBytecode) #(249 #extPushFullClosureBytecode) #(250 #extPushClosureBytecode) #(251 #pushRemoteTempLongBytecode) #(252 #storeRemoteTempLongBytecode) #(253 #storeAndPopRemoteTempLongBytecode) #(254 255 #unknownBytecode))
	"1 byte bytecodes"
	"for booleanCheatSistaV1:"
	"for booleanCheatSistaV1:"
	"for booleanCheatSistaV1:"
	"for booleanCheatSistaV1:"
	"for booleanCheatSistaV1:"
	"for booleanCheatSistaV1:"
	"i.e. a 0 arg special selector"
	"i.e. a 1 arg special selector"
	"for booleanCheatSistaV1:"
	"was blockCopy:"
	"i.e. a 1 arg special selector"
	"i.e. a 0 arg special selector"
	"i.e. a 1 arg special selector"
	"i.e. a 0 arg special selector"
	"i.e. a 0 arg special selector"
	"2 byte bytecodes"
	"3 byte bytecodes"