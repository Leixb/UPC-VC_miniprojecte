% Donat un model i les categories de hog aplica el model en les dades pertinents
function [label, expected] = labelHOGtest(model, hog_test, categories)

    rows = ismember(hog_test(:,end), categories);
    hg = hog_test(rows,1:(end-1));
    expected = hog_test(rows, end);
    label = model.predictFcn(hg);

end
