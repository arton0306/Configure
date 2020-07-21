## GCC
*  `gcc -E` : Preprocess, but don't compile (or use cpp `<filename>`)
*  `gcc -S` : Compile, but don't assemble
*  `gcc -c` : Preprocess, compile, and assemble, but don't link

### including file search path order
1. the same folder of the source file
2. `-iquota`
3. `-I`

### system including file search path
`echo | gcc -v -x c -E -`
1. system default path (can be disabled by `-nostdinc`)
2. `-I`
