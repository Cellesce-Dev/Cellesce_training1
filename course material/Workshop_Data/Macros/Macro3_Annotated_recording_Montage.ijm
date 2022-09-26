
// Creat Hyperstack that separates channels (3) and z-Positions
//    For batch processing the slicenumber will have to change
//	  slice= total_image_number/3

run("Stack to Hyperstack...", "order=xyczt(default) channels=3 slices=15 frames=1 display=Grayscale");



// Split Hyperstack in individual stacks, 1 per channel
run("Split Channels");


// Perform Maximal_Projection of all slices 
// 		Here this is done separately for each image
// 		This could be pritten as a loop in the Macro
//				*choose desired image
//				* perform Z-projection
//				* close channel stack
// 		To slect correct window automatically in a macro define Image name automatically
//				This name will need to be conactinated with other informatin (i.e. "C1-" or "MAX_" .. to be used here

selectWindow("C1-Examplestack_1.tif");
run("Z Project...", "projection=[Max Intensity]");
selectWindow("C1-Examplestack_1.tif");
close();

selectWindow("C2-Examplestack_1.tif");
run("Z Project...", "projection=[Max Intensity]");
selectWindow("C2-Examplestack_1.tif");
close();

selectWindow("C3-Examplestack_1.tif");
run("Z Project...", "projection=[Max Intensity]");
selectWindow("C3-Examplestack_1.tif");
close();


/// Merge channels to creat colour composit
selectWindow("MAX_C2-Examplestack_1.tif");
run("Merge Channels...", "c1=MAX_C1-Examplestack_1.tif c2=MAX_C3-Examplestack_1.tif c3=MAX_C2-Examplestack_1.tif create keep");
run("Set Scale...");



// Change colour of single stacks 
selectWindow("MAX_C1-Examplestack_1.tif");
run("Red");
selectWindow("MAX_C2-Examplestack_1.tif");
run("Blue");
selectWindow("MAX_C3-Examplestack_1.tif");
run("Green");


// Make composit into an RGB-Image 
selectWindow("Composite");
run("Stack to RGB");
selectWindow("Composite");
close();

// Creat a stack of all open windows
//		!make sure you have closed all unnecessary images 
run("Images to Stack", "name=Stack title=[] keep");

// Creat Monatge		
run("Make Montage...", "columns=4 rows=1 scale=0.50");

// Add Scale bar
// 		The measurments here depend on the microscope used, make sure to double check each time
run("Set Scale...", "distance=5.7154 known=1 unit=µm");
run("Scale Bar...", "width=10 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");

// Save Montage
// 		For batch processing define an outputfolder and change the name to reflect the original Image name

saveAs("Tiff", "/Users/Anika/Desktop/Montage.tif");

