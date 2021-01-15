% Calcula descriptors generals de les imatges de train i test i guarda els valors
trainPattern = fullfile('../images/Train/**', '*.png');
train = processFolder(trainPattern);
writetable(train, 'train_desc.csv');

testPattern = fullfile('../images/Test/**', '*.png');
test = processFolder(testPattern);
writetable(test, 'test_desc.csv');
