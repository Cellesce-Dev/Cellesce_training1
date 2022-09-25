// OBJECTIVE: This macro demonstrates how to display messages.  

// As an example, this might be suefull if displaying setting used (i.e. threshold values) 

// NOTE: This is a comment
// Anything after "//" is ignored by ImageJ
// You can write messages here describing the macro

// NOTE: All lines of code in a macro end with a semicolon.  
// This tells ImageJ where the end of the current command is.  


// CODE:
// The command below will display "Hello World!" in the ImageJ log window.
// The quotation marks tell ImageJ the characters are text. (In programming, 
// text is referred to as a string)
print("Hello World!");

// The log window can also display numbers.  
// Numbers alone don't require quotation marks.
print(42);

// Adding a blank line to the log window
print(" ");

// Variables can also be expressed using the prit funktion
// Observe the differnce using print("threshold") vs print(threshold)
threshold=15;
print(threshold);
print("threshold");



// in line 28 the variable threshold is defined as 15
// in line 29 this variable is displayed
// line 30 prints the text (string) threshold