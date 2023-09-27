package main

import (
  "fmt"
  "os"
)

func checkError(e error) {
  if e != nil {
    panic(e)
  }
}

func interpret(code []byte) {
  data := make([]byte, 30000)
  dptr := 0

  code_len := len(code)
  pc := 0
  for pc < code_len {
    opcode := code[pc]
    switch opcode {
    case '+':
      data[dptr]++
    case '-':
      data[dptr]--
    case '.':
      fmt.Printf("%c", data[dptr])
    case ',':
      os.Stdin.Read(data[dptr:dptr+1])
    case '>':
      dptr++
    case '<':
      dptr--
    case '[':
      if data[dptr] == 0 {
        nested := 1
        for nested > 0 {
          pc++
          c := code[pc]
          if c == ']' {
            nested--
          } else if c == '[' {
            nested++
          }
        }
      }
    case ']':
      if data[dptr] != 0 {
        nested := 1
        for nested > 0 {
          pc--
          c := code[pc]
          if c == '[' {
            nested--
          } else if c == ']' {
            nested++
          }
        }
      }
    }
    pc++
  }

}

func main() {
  if len(os.Args) < 2 {
    panic(fmt.Errorf("Usage: %s <brain_fuck_file>", os.Args[0]))
  }

  code, err := os.ReadFile(os.Args[1])
  checkError(err)
  fmt.Printf("Successfully read file: %v\n", os.Args[1])
  interpret(code)
}
