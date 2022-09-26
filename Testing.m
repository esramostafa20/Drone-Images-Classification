testimage=imread('C:\Users\esraa\Desktop\Matlab_CNN\Testing Images\00000036.jpg');

ds = augmentedImageDatastore(imageSize, testimage,...
    'ColorPreprocessing', 'gray2rgb');

imgFeatures = activations(net, ds, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');

pred = predict(classifier, imgFeatures, 'ObservationsIn', 'columns');

sprintf("The Image is a %s", pred)
