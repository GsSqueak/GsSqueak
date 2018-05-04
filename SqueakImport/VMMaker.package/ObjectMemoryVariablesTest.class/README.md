ObjectMemoryVariablesTest validates the values of the constants defined in ObjectMemory class>>initBytesPerWord:

The intent is to enable rewriting these constants in a manner that permits them to be fully defined as C preprocessor macros at compile time, such that separate code generation is not required for 32-bit and 64-bit object memory.

See CCodeGenerator>>emitDefineBytesPerWordOn: for the C preprocessor macro definitions.