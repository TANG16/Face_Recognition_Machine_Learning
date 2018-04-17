function [training_data,test_data] = extra_credit()
data = load(strcat('/home/dark_knight/UMD/Courses/ENEE439M/Project1/Data/data.mat'));
neutral = data.face(:, :, 1:3:598);
happy = data.face(:, :, 2:3:599);
illum = data.face(:, :, 3:3:600);
state = cat(3, neutral, happy, illum);

numx = 1;
for subject = 1 : 3
    for iter = 1 : 200
        face(:, iter, subject) = reshape(state(:,:, numx), [], 1);
        numx = numx + 1;
    end
end
training_data = face(:,1:132,:);
test_data = face(:,133:200,:);
end