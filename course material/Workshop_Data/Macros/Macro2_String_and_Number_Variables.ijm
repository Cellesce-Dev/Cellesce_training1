// OBJECTIVE: This macro demonstrates how to work with number- and string type variables.
// Here, numbers are assigned a reference name.  The number can be used later on
// using this reference name.

// EXAMPLE: You can store parameters at the beginning of a macro, before they are
// needed.  The parameters are then used in the code by stating the reference name, 
// rather than constantly-retyping the value.  This allows you to keep all the
// parameters in one, easy to find place.  Also, if the value is used in more than
// one line it means you only need to change it once.


// NOTE: Variable names can be whatever you want, but must not contain whitespace
// characters and must start with a letter (although they can contain numbers 
// thereafter).


// NOTE: Any variables created within a macro are lost when the macro finishes.  This
// is the same for the other type of variables we see in the coming demos.

// Numbers:
// NOTE: Numbers stored as variables behave like explicitly-typed numbers so that you
// can perform mathematical operations 

// CODE:
// This sets the variable called number_var to the value 15. This is then displayed with text in the log window.
number_var = 15;
print("The number stored in number_var:");
print(number_var);

// Number-type variables can be used interchangeably with explicity-typed numbers.
// Here we assign two variables the values 10 and 5, then use these in a calculation
// and assign the resulting value to another variable.
my_number_1 = ;
my_number_2 = ;

my_number_3 = (my_number_1 + my_number_2) * 7;

print("The result is:");
print(my_number_1);

// Strings

// NOTE: Strings are text sequences surrounded by quotation marks.

// NOTE: Strings can be linked together using the + symbol in a process called 
// "concatenation"

// NOTE: String and number-type variables can be concatenated together, which results
// in a string (the numeric property of the number is lost).


// CODE:
// This sets the variable called string_var to the text "your string", then displays
// it in the log window.
string_var = "Hello";
print("The text stored in string_var:");
print(string_var);

// Strings can be combined together (concatenated).  Here we assign two string-type
// variables, concatenate them and store the result to a new variable.  The contents
// of this new variable are then displayed in the log window.
my_var_1 = ";
my_var_2 = ;
my_var_3 = my_var_1 + " " + my_var_2;

print("The concatenated strings:");
print(my_var_3);

