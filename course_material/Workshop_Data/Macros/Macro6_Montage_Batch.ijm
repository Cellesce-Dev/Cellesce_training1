// Open Folder containing multiple stacks
//		This will open a dialogue box to open a folder containing stacks
//		A fileList ist generated containing all stack/image names
//		!! The folder can only contain the correct images type (i.e. .tiff)

inputDirectory = getDirectory("Choose a File");
fileList = getFileList(inputDirectory);

print(inputDirectory)

// Create folder to save data
// 		Make subfolder to save results with date  at the orginal folder location
	
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
TimeString ="" + year + "_";
if (month<10) {TimeString = TimeString+"0";}
TimeString = TimeString + (month+1) + "_";
if (dayOfMonth<10) {TimeString = TimeString+"0";}
TimeString = TimeString + dayOfMonth + "_" + hour +"" +minute ;


outputPath = inputDirectory  + TimeString ;

File.makeDirectory(outputPath);



// 		Loop though each file in the  fileList and performs a process
// 			the funktion porcessImge is defind below
//			
for (i = 0; i < fileList.length; i++)
{
    processImage(fileList[i],outputPath);
}



// Define the Processing function
// 			the function takes an argument imageFile (this is each file in the fielList generated above)
//			and  outputpath generated above to save the images
//			all steps of the funktion are withing the { }
function processImage(imageFile, outputPath)
{

// 1. Open the file
open(imageFile);

// 2. Read image_name
Image_name=getTitle();


// 3. Creat Hyperstack that separates channels (3) and z-Positions
//    For batch processing the slicenumber will have to change
//	  slice= total_image_number/3

run("Stack to Hyperstack...", "order=xyczt(default) channels=3 slices="+ (nSlices/3) +" frames=1 display=Grayscale");



// 4. Split Hyperstack in individual stacks, 1 per channel
run("Split Channels");


// 5. Perform Maximal_Projection of all slices 
// 		Here this is done separately for each image
// 		This could be pritten as a loop in the Macro
//				*choose desired image
//				* perform Z-projection
//				* close channel stack
// 		To slect correct window automatically in a macro define Image name automatically
//				This name will need to be conactinated with other informatin (i.e. "C1-" or "MAX_" .. to be used here

selectWindow("C1-"+Image_name);
run("Z Project...", "projection=[Max Intensity]");
selectWindow("C1-"+Image_name);
close();

selectWindow("C2-"+Image_name);
run("Z Project...", "projection=[Max Intensity]");
selectWindow("C2-"+Image_name);
close();

selectWindow("C3-"+Image_name);
run("Z Project...", "projection=[Max Intensity]");
selectWindow("C3-"+Image_name);
close();


/// 6. Merge channels to creat colour composit
selectWindow("MAX_C2-"+Image_name);
run("Merge Channels...", "c1=MAX_C1-"+Image_name+" c2=MAX_C3-"+Image_name+" c3=MAX_C2-"+Image_name+" create keep");
run("Set Scale...");



// 7. Change colour of single stacks 
selectWindow("MAX_C1-"+Image_name);
run("Red");
selectWindow("MAX_C2-"+Image_name);
run("Blue");
selectWindow("MAX_C3-"+Image_name);
run("Green");


// 8. Make composit into an RGB-Image 
selectWindow("Composite");
run("Stack to RGB");
selectWindow("Composite");
close();

// 9. Creat a stack of all open windows
//		!make sure you have closed all unnecessary images 
run("Images to Stack", "name=Stack title=[] keep");

// 10. Creat Monatge		
run("Make Montage...", "columns=4 rows=1 scale=0.50");

// 11. Add Scale bar
// 		The measurments here depend on the microscope used, make sure to double check each time
run("Set Scale...", "distance=5.7154 known=1 unit=µm");
run("Scale Bar...", "width=10 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");


// 12. Save Montage
// 		For batch processing define an outputfolder and change the name to reflect the original Image name




saveAs("Tiff", outputPath + "/" + Image_name + "-Montage.tif");
close("*");
}
