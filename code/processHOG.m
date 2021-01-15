% Calcula descriptors de HOG de les imatges de train i test i guarda els valors
trainPattern = fullfile('../images/Train/**', '*.png');
[train, trainLabels] = HOGFeatures(trainPattern);
writematrix([train, trainLabels], 'train_hog.csv');

testPattern = fullfile('../images/Test/**', '*.png');
[test, testLabels] = HOGFeatures(testPattern);
writematrix([test, testLabels], 'test_hog.csv');
