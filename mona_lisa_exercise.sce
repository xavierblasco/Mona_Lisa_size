//Plotting Mona Lisa pixels for n distances

//define Pixel size
Sp= 0.00408; //Size of squared pixel size in mm
Sw= 1288; //Screen Width in Pixels
Sh= 728; //Screen Height in Pixels
f= 8; //Lense focal distance in mm


//Mona Lisa size
ML_w = 0.77;//Mona Lisa Width in meters (Landscape orientation)
ML_h = 0.53;//Mona Lisa Height in meters (Landscape orientation)

//nearest distance to plot
x0 = 1; //Define nearest distance to plot in meters

//farthest distance to plot
x1 = 20; //Define farthest distance to plot in meters

//define steps
step = 0.1; //define step for plotting in meters

//Width Angle for this lense
Angle_w = 2*(atan(Sp*Sw/(2*f))); //Angle W in radians
Angle_h = 2*(atan(Sp*Sh/(2*f))); //Angle H in radians

//define range for distances
x=[x0:step:x1];

//obtains pixels for each distance
index = 1;
for i=x0:step:x1
    //Get image width for current distance
    Hip_w = i /(cos(Angle_w/2)); //Get valu of Hipot angle w
    Image_w = 2* Hip_w * sin(Angle_w/2);//Obtains Total wide of image for current distance in meters
    
    //Get image height for current distance
    Hip_h = i /(cos(Angle_h/2)); //Get valu of Hipot angle h
    Image_h = 2* Hip_h * sin(Angle_h/2);//Obtains Total height of image for current distance in meters
    
    ML_w_pixels = floor(Sw * (ML_w /Image_w));//Obtain Mona Lisa width pixels as proportion of total image 
    ML_h_pixels = floor(Sh * (ML_h /Image_h));//Obtain Mona Lisa height pixels as proportion of total image
    
    //Number of Pixels = Width pixels x Height pixels
    y(index)= ML_w_pixels * ML_h_pixels;
    
    index = index + 1;
end


//plot function
plot(x,y);
