// this a comment, write anything you want

/*
    that's how you
    comment out multiple lines
*/

#include <iostream>
// '#include' let you import libraries
// which contain additional macros, functions, predclared variables, etc

using namespace std; // don't worry about this just yet

int main() // the 'int' says that our main-routine will give back an integer number to the user or program that runs it
{
    cout<<"Hello world";		 //cout belongs to iostream (see line 7)
    cout<<endl; 			// 'endl' means 'end line' -> starts a new line
//    cout<<"Hello world"<<endl; 	// is also possible

    cout<<"who are you?"<<endl;
    string user_name; // declare a string of characters with name 'user_name'
    cin>>user_name;   // write input to user_name
    cout<<"Hello "<<user_name<<endl;

    return 0; 	// stops program and returns 0  which usually means 'all went well'
}

// note that all commands end with a ';'

//compile and execute in CodeBlocks: 'build and run'
//                             F9
