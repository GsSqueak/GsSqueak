class initialization
initialize
  "ParseNode initialize. VariableNode initialize"

  LdInstType := 1.
  LdTempType := 2.
  LdLitType := 3.
  LdLitIndType := 4.
  SendType := 5.	"Back in the day the following constants corresponded to bytecodes.
	Now they're just unique values that need to be eliminated when and if
	things like code:type: are cleaned up."
  CodeBases := #(0 16 32 64 208).
  CodeLimits := #(16 16 32 32 16).
  LdSelf := 112.
  LdTrue := 113.
  LdFalse := 114.
  LdNil := 115.
  LdMinus1 := 116.
  LoadLong := 128.
  LdSuper := 133.
  LdThisContext := 137.
  SendPlus := 176.
  Send := 208	"((ParseNode class >> #initialize) literals select: [:l| l isVariableBinding
	and: [(ParseNode classPool includesAssociation: l) and: [(self
	systemNavigation allCallsOn: l localTo: ParseNode) size = 1]]]) sort: [:a
	:b| a key <= b key]"	"ParseNode classPool associations select: [:a| (self systemNavigation
	allCallsOn: a localTo: ParseNode) isEmpty]"