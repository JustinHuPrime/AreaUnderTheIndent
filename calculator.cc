#include <cstdlib>
#include <fstream>
#include <iostream>

namespace {
using std::cerr;
using std::cout;
using std::ifstream;
using std::strtoull;
}  // namespace

int main(int argc, char *argv[]) {
  if (argc != 2 && argc != 3) {
    cerr << "Expected optional -t<N> to set tab size in spaces and mandatory "
            "file name to process.\n";
    return 1;
  }

  size_t tabSize = 2;
  size_t area = 0;
  char const *file =
      argc == 3 ? argv[2] : argv[1];  // file is always the last string
  ifstream fin;

  if (argc == 3)
    tabSize = strtoull(argv[1] + 2, nullptr, 10);  // if tab size is an argument

  fin.open(file);
  if (!fin.good()) {
    cerr << "Couldn't open file '" << file << "'\n";
    return 2;
  }

  bool startOfLine = true;
  while (true) {
    int c = fin.get();
    if (c == ifstream::traits_type::eof()) {  // end of file - print result
      cout << area << '\n';
      return 0;
    } else if (startOfLine) {  // we're at the start of the line - count stuff
      switch (c) {
        case ' ': {
          area++;
          break;
        }
        case '\t': {
          area += tabSize;
          break;
        }
        case '\n':
        case '\r': {  // reached end of whitespace only line
          break;
        }
        default: {  // saw non-whitespace character
          startOfLine = false;
        }
      }
    } else if (c == '\n' || c == '\r') {  // reached new line
      startOfLine = true;
    }
  }
}