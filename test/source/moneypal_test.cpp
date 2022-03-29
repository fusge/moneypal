#include "lib.hpp"

auto main() -> int
{
  library lib;

  return lib.name == "moneypal" ? 0 : 1;
}
