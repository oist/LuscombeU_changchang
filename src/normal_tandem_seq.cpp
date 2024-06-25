#include <Rcpp.h>
#include <string>
#include <algorithm>

// [[Rcpp::export]]
std::string tandemNormalForm_rcpp(std::string str) {
  size_t len = str.length();
  size_t sub_len = len / 2;

  std::string smallest_substr = str.substr(0, sub_len);

  for (size_t i = 1; i <= sub_len; ++i) {
    std::string current_substr = str.substr(i, sub_len);
    if (current_substr < smallest_substr) {
      smallest_substr = current_substr;
    }
  }

  return smallest_substr;
}
