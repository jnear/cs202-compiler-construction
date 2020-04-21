class Polygon {
  protected:
    int width, height;
  public:
    void set_values (int a, int b)
      { width=a; height=b; }
  virtual int dummy () { return 1; }
    virtual int area ()
      { return 0; }
};

// method table:
//   dummy -> code
//   area  -> code

class Rectangle: public Polygon {
  public:
    int area ()
      { return width * height; }
};

// method table:
//   dummy -> code
//   area  -> "rectangle" code


class Triangle: public Polygon {
  public:
    int area ()
      { return (width * height / 2); }
};

int main () {
  Rectangle rect;
  Triangle trgl;
  Polygon poly;
  Polygon * ppoly1 = &rect;
  Polygon * ppoly2 = &trgl;
  Polygon * ppoly3 = &poly;
  ppoly1->set_values (4,5);
  ppoly2->set_values (4,5);
  ppoly3->set_values (4,5);

 // ppoly1 :
 //  - method table:
 //   area(): pointer to rectangle's
 //      area function
 //  - fields:
 //    width
 //    height

  
  int a = ppoly1->area();
  int b = ppoly2->area();
  int c = ppoly3->area();

  return 0;
}
