% Clasifica la imatge

% finalLabel es la label final
% label es la intermitja (classificador general)

function [finalLabel, label] = labelSignal(I)

    categories = ["speed", "speed", "speed", "speed", "speed", "speed", "end", "speed", ...
        "speed", "pass", "pass", "tri", "sq", "ceda", "stop", "emptyC", "speed", ...
        "direcPro", "tri", "tri", "tri", "tri", "tri", "tri", "tri", "tri", "triS", ...
        "tri", "tri", "tri", "tri", "tri", "end", "direc", "direc", "direc", ...
        "direc", "direc", "direc", "direc", "direc", "end", "end"];

    [~, gNames] = grp2idx(categories);
    load('models.mat');
    
    I = preprocess(I);

    desc = descriptors(I);
    desc = struct2table(desc, 'AsArray', true);

    label = modelGeneral.predictFcn(desc);

    label = string(gNames(label));

    done = true;
    color = "black";

    if label == "speed"
        done = false;
        model = modelRedC;
    elseif label == "end"
        done = false;
        model = modelCircleEnd;
    elseif label == "pass"
        % TODO
        finalLabel = 9;
    elseif label == "tri"
        done = false;
        model = modelTriangle;
    elseif label == "sq"
        finalLabel = 12;
    elseif label == "ceda"
        finalLabel = 13;
    elseif label == "stop"
        finalLabel = 14;
    elseif label == "emptyC"
        finalLabel = 15;
    elseif label == "direcPro"
        finalLabel = 17;
    elseif label == "triS"
        finalLabel = 26;
    elseif label == "direc"
        done = false;
        model = modelBlueC;
        color = "white";
    else
        finalLabel = 404;
        warning("404 - Not Found")
        return
    end

    if done
        disp(finalLabel)
        return
    end

    [mask, colors] = maskFinder(I);
    features = hogDesc(mask, colors.(color));

    finalLabel = model.predictFcn(features);
end
