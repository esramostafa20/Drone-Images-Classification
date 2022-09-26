%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
clc
clear all
outputFolder ='C:\Users\esraa\Desktop\Matlab_CNN\planes_Modified';
%rootFolder=fullfile(outputFolder,'planes_Modified');

categories={'drone','fighter_jet','helicopter','missile','passenger_plane','rocket'};

imds =imageDatastore(outputFolder,'LabelSource', 'foldernames', 'IncludeSubfolders',true);

% count number of images in each label
tbl = countEachLabel(imds)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% After applying the above code , it shows that each label has different
% number of images 
% so we need to adjust the number of the labels to be the same

minSetCount = min(tbl{:,2}); 
maxNumImages = 1165 ;
minSetCount = min(maxNumImages,minSetCount);
imds = splitEachLabel(imds, minSetCount, 'randomize');
countEachLabel(imds)

% Here, i want to show, one image from each category
rocket =find(imds.Labels=='rocket',1)
missile =find(imds.Labels=='missile',1)
helicopter =find(imds.Labels=='helicopter',1)
drone =find(imds.Labels=='drone',1)

figure
subplot(2,2,1)
imshow(readimage(imds,rocket));
subplot(2,2,2)
imshow(readimage(imds,drone));
subplot(2,2,3)
imshow(readimage(imds,helicopter));
subplot(2,2,4)
imshow(readimage(imds,missile));

