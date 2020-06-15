#include <iostream>
using namespace std;

int main()
{
    // add numbers from 1 to 10
    int sum=0;
    sum = sum + 1;
    sum = sum + 2;
    sum = sum + 3;
    sum = sum + 4;
    sum = sum + 5;
    sum = sum + 6;
    sum = sum + 7;
    sum = sum + 8;
    sum = sum + 9;
    sum = sum + 10;
    // not practical, use for-loop instead

    int n(10);

//first print out numbers 1 to n:

//                //done at the start:      loop runs until this condition is false:                 increase loop variable
    for(                 int i=1;                                      i<=n;                         i++)
        cout<<i<<endl;

/*    for(int i=1;i<=n;i=i+1) //also possible, but uncommon and it can be a tiny bit slower
        cout<<i<<endl;
*/

//    now add:

    sum=0; // set sum 0 again
    for(int i=1;i<=n;i++)
        sum = sum +i;
    cout<<"sum = "<<sum<<endl;
    

    sum=0; // 
    for(int i=1;i<=n;i++)
    { // if more than one command should be executed in the loop we need { }
        cout<<i<<endl;
        sum = sum +i;
    }
    // the variable 'i' was only declared within the scope of the for-loop (lines 41-45). We cannot use anymore.
    cout<<"sum = "<<sum<<endl;

    return 0;
}
