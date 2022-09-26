%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

featureLayer = 'fc1000';
trainingFeatures = activations(net, augmentedTrainingSet, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');

% Get training labels from the trainingSet
trainingLabels = trainingSet.Labels;

% 'ObservationsIn' to 'columns' to match the arrangement used for training
% features.
classifier = fitcecoc(trainingFeatures, trainingLabels,'Learners', 'Linear',...
    'Coding', 'onevsall', 'ObservationsIn', 'columns');