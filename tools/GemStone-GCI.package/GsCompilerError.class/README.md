/*=========================================================================
 *
 *   COMPILER ERRORS - numbered from 1001 to 1999
 *
 *    Compiler errors are reported differently than other errors.  Rather 
 *    than having a single error and zero or more arguments, all compiler 
 *    errors are reported as error COMPILER_ERR_STDB(defined below as 1001) . 
 *    This error has either 1 or 6 arguments, as follows:
 *      1) An array of error descriptors (always present)
 *        Each error descriptor is an array of three elements: 
 *         1) specific error number from 1002 to 1063 (see below)
 *         2) an offset into the source code string pointing to where the 
 *            error was detected.  
 *         3) string describing the error 
 *    The following error arguments are present only if the compilation error
 *    occurred during automatic recompilation of methods for class modification.
 *      2) Source string of the compilation in error
 *      3) receiver of the recompilation method
 *      4) category of method containing the error
 *      5) symbolList used by the recompilation
 *      6) selector of the method containing the error
 *    See Behavior|recompileAllMethodsInContext:  for more details.
 *    
 *=========================================================================
 */