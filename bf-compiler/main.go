package main

import (
	"bytes"
	"fmt"
	"os"
)

func checkError(e error) {
	if e != nil {
		panic(e)
	}
}

const (
	prologue = `
.text
.globl _main
_main:
	pushq %rbp
	movq %rsp, %rbp
	pushq %r12
	subq $30008, %rsp
	leaq (%rsp), %rdi
	movl $0, %esi
	movq $30000, %rdx
	call memset
	movq %rsp, %r12`
	epilogue = `
	leave
	ret
	`
)

func compile(code []byte) ([]byte, error) {
	var asm_code bytes.Buffer

	asm_code.WriteString(prologue)
	asm_code.WriteString("\n")

	stack_brackets := []int{}
	num_brackets := 0

	code_len := len(code)
	pc := 0
	for pc < code_len {
		opcode := code[pc]
		switch opcode {
		case '+':
			asm_code.WriteString("	incb (%r12)\n")
		case '-':
			asm_code.WriteString("	decb (%r12)\n")
		case '.':
			asm_code.WriteString("	movzbl (%r12), %ecx\n")
			asm_code.WriteString("	call putchar\n")
		case ',':
			asm_code.WriteString("	call getchar\n")
			asm_code.WriteString("	movb %al, (%r12)\n")
		case '>':
			asm_code.WriteString("	inc %r12\n")
		case '<':
			asm_code.WriteString("	dec %r12\n")
		case '[':
			stack_brackets = append(stack_brackets, num_brackets)
			asm_code.WriteString("	cmpb $0, (%r12)\n")
			asm_code.WriteString(fmt.Sprintf("	je bracket_%d_end\n", num_brackets))
			asm_code.WriteString(fmt.Sprintf("bracket_%d_start:\n", num_brackets))
			num_brackets++
		case ']':
			matching_bracket := stack_brackets[len(stack_brackets)-1]
			stack_brackets = stack_brackets[:len(stack_brackets)-1]
			asm_code.WriteString("	cmpb $0, (%r12)\n")
			asm_code.WriteString(fmt.Sprintf("	jne bracket_%d_start\n", matching_bracket))
			asm_code.WriteString(fmt.Sprintf("bracket_%d_end:\n", matching_bracket))
		}
		pc++
	}
	asm_code.WriteString(epilogue)
	asm_code.WriteString("\n")
	return asm_code.Bytes(), nil
}

func main() {
	if len(os.Args) < 3 {
		panic(fmt.Errorf("Usage: %s <brain_fuck_file> <output_asm_file>", os.Args[0]))
	}

	code, err := os.ReadFile(os.Args[1])
	checkError(err)
	fmt.Printf("Successfully read file: %v\n", os.Args[1])
	asm_code, err := compile(code)
	checkError(err)
	os.WriteFile(os.Args[2], asm_code, 0644)
	fmt.Printf("Successfully write asm file: %v\n", os.Args[2])
}
