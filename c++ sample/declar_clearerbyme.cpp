#include <iostream>
using namespace std;

int main()
{
    int z; // declare new integer variable z
    cout << "not initialised : "<< z << endl; // z might have any possible value (depends on the particular compiler)
    
    int a = 0; // a is declared and initialised
    cout << "initialised as 0 : " << a << endl;
    
    int b(-6); // also possible
    cout << "initialised as -6 : " << b << endl;

// we can assign new values to variables

    a = 3;
    cout << "a = "<<a<<endl;

// or values of other variables

    a = b;
    cout<<"a = "<<a<<endl;

// or calculate things

    a = 3 + b + a; // on the right side the old value (from line 17) of a is used for the calculation.
	           // The total value of the right side is then assigned to a
    if( a == 0 )   // note the use of double '=' for testing equality
    {			    //
        cout << " a = 0 " << endl;     //  the space between one set of curly brackets
        if( a == 1 )		       //  (e.g. lines  22-26)
	  cout << " a = 1 " << endl;   //   is called a 'scope'
    }		             //
    else //at eny other case
        cout <<" a is not 0 " << endl;
    
    //note there is no ';' after an if-condition or afer 'else'
    
    return 0;
}
