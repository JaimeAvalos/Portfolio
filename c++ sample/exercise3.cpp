#include <iostream>
   
   using namespace::std; 

    class Complex
    {       
    
    public:
    
    Complex( float = 0, float = 0);
    
    void Recibe();
    
    float Real();
    float Imaginario();
    
    void Suma(float, float, float, float);
    void Resta(float, float, float, float);
    
    void Multiplication(float, float, float, float);
    void Division(float, float, float, float);
    void Absolute(float, float, float, float);
    

    void Impresion()
    /* Esta funcion miembro, por ser la mas simple, se definira
       aqui mismo, solo como un ejemplo de que esto puede hacerse */
    {         // Abre la funcion miembro Impresion
    cout << "( " << R << " , " << I <<" )" << endl;
    }        // Cierra la funcion miembro Impresion

    private:
    float R;
    float I; 
    };           // Cierra la clase complex

   //////////////////////////////////////////////////////////////
   // CONSTRUCTOR
   /////////////////////////////////////////////////////////////////

   Complex::Complex( float a, float b)
   {       // Abre constructor
   R = a;
   I = a;
   }         // Cierra constructor
  
   /////////////////////////////////////////////////////////////////
   // FUNCION MIEBRO RECIBE
   /////////////////////////////////////////////////////////////////

   void Complex::Recibe() 
   {          // Abre funcion miembro Recibe
   cout << "\nIntroduzca la parte real del numero: " << endl;
   cin >> R;
   cout << "\nIntroduzca la parte compleja del numero: " << endl;
   cin >> I;
   }          // Cierra funcion miembro Recibe

  ///////////////////////////////////////////////////////////////////
  // FUNCION MIEMBRO REAL
  //////////////////////////////////////////////////////////////////

  float Complex::Real()
  {
   return R;
  } 

  /////////////////////////////////////////////////////////////////
  // FUNCION MIEMBRO IMAGINARIO 
  ////////////////////////////////////////////////////////////////

  float Complex::Imaginario()

  {
   return I;
  } 

   ////////////////////////////////////////////////////////////////
   // FUNCION MIEMBRO SUMA 
   ///////////////////////////////////////////////////////////////

  void Complex::Suma( float a, float b, float c, float d)

   {            // Abre funcion miembro Suma
  cout <<"\n La suma de los numeros es:  ( "  << a + c
       << " , " << b + d 
       <<" )" << endl;
   }            // Cierra funcion miembro Suma

  //////////////////////////////////////////////////////////////
  // FUNCION MIEMBRO RESTA
  //////////////////////////////////////////////////////////////

  void Complex::Resta( float a, float b, float c, float d)

  {         // Abre funcion miembro Resta  
  cout <<"\n La resta de los numeros es:  ( " << a - c << " , " 
       << b - d 
       <<" )" << endl;
  }          // Cierra funcion miembro Resta

  void Complex::Multiplication( float a, float b, float c, float d)
  {           
  cout <<"\n The multiplication is  ( " << a*c-b*d << " , " 
       << b*c - d*a 
       <<" )" << endl;
  } 
  
  void Complex::Division( float a, float b, float c, float d)
  {           
  cout <<"\n The division is  ( " << (a*c+b*d)/(c*c+d*d) << " , " 
       << (b*c - d*a)/(c*c+d*d)
       <<" )" << endl;
  } 
  
  void Complex::Absolute( float a, float b, float c, float d)
  {           
  cout <<"\n The absolute value of first number is " << a*a+b*b << " and of the second " 
       << c*c+d*d << endl;
  } 

  int main()
  
  {           // Abre main
  Complex s;
  Complex x;
  Complex y;

  x.Recibe();
  y.Recibe();
  s.Suma(x.Real(), x.Imaginario(), y.Real(), y.Imaginario());  
  s.Resta(x.Real(), x.Imaginario(), y.Real(), y.Imaginario());
  s.Multiplication(x.Real(), x.Imaginario(), y.Real(), y.Imaginario());
  s.Division(x.Real(), x.Imaginario(), y.Real(), y.Imaginario());
  s.Absolute(x.Real(), x.Imaginario(), y.Real(), y.Imaginario());
   
  return 0; 
  
  }           // Cierra main
