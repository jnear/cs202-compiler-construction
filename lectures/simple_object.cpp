class Point {
    int x, y;
  public:
    void set_values (int,int);
} pt;

void Point::set_values (int xv, int yv) {
  x = xv;
  y = yv;
}

int main() 
{
  Point pt;
  pt.set_values (3,4);
  return 0;
}
