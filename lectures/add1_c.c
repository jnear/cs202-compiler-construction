
int add1(int x) {
  return x + 1;
}

int main() {
  return add1(4);
}

/*
// Same, but with function pointer:

int main() {
  int (*fun_ptr)(int) = &add1;

  return (*fun_ptr)(4);
}
*/
