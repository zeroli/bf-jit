#include <vector>
#include <cstdio>
#include <cassert>
#include <cstdlib>
#include <memory>

std::vector<char> readSrc(const char* bf_file)
{
  std::vector<char> src;
  FILE* ifile = fopen(bf_file, "r");
  if (!ifile) {
    fprintf(stderr, "Failed to open file for reading: %s\n", bf_file);
    return src;
  }
  fseek(ifile, 0, SEEK_END);
  auto flen = ftell(ifile);
  rewind(ifile);
  src.resize(flen);
  fread(&src[0], 1, flen, ifile);
  fclose(ifile);
  return src;
}

void interpret(const std::vector<char>& code)
{
  if (code.empty()) {
    fprintf(stderr, "bf code is empty\n");
    return;
  }
  std::vector<char> data(30000, 0);

  char* dptr = &data[0];

  for (auto cptr = code.begin(); cptr != code.end(); ++cptr) {
    auto opcode = *cptr;
    switch (opcode) {
    case '+':  // inc data
      (*dptr)++; 
      break;
    case '-':  // dec data
      (*dptr)--;
      break;
    case '>': // move forward data ptr
      dptr++;
      break;
    case '<': // move backward data ptr
      dptr--;
      break;
    case '.': // get input
      putchar((int)(*dptr));
      break;
    case ',':  // output
      *dptr = getchar();
      break; 
    case '[':
      if (*dptr == 0) {
        int nested = 1;
        // find matching ']' forward
        while (nested) {
          auto c = *++cptr;
          if (c == ']') {
            --nested;
          } else if (c == '[') {
            ++nested;
          }
        }
      }
      break;
    case ']':
      if (*dptr != 0) {
        int nested = 1;
        // find matching '[' backward
        while (nested) {
          auto c = *--cptr;
          if (c == '[') {
            --nested;
          } else if (c == ']') {
            ++nested;
          }
        }
      }
      break;
    // skip others
    }
  }
}

int main(int argc, char** argv)
{
  if (argc < 2) {
    fprintf(stderr, "Usage: %s <brain_fuck_file>\n", argv[0]);
    exit(-1);
  }

  auto src = readSrc(argv[1]);

  interpret(src);
  return 0;
}

