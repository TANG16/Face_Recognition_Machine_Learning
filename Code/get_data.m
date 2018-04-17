function [training_data,test_data] = get_data(dataset_selected)
if dataset_selected == 1
    dataset = 'data';
elseif dataset_selected == 2
    dataset = 'illumination';
elseif dataset_selected == 3
    dataset = 'pose';
end
data = load(strcat('/home/dark_knight/UMD/Courses/ENEE439M/Project1/Data/',dataset,'.mat'));
if strcmp(dataset,'data')
    j=1;
    for i = 1:3:598
        a = [i i+1 i+2];
        %% load traing data here in a data structure
        l = 1;
        for k = 1:2:3
            training_data(:,l,j) = reshape(data.face(:,:,a(k)),[],1);
            l = l+1;
        end
        test_data(:,1,j) = reshape(data.face(:,:,a(2)),[],1);
        j = j+1;
    end
elseif strcmp(dataset,'illumination')
    training_data = data.illum(:,1:2,:);
    test_data = data.illum(:,3:21,:);
    
elseif strcmp(dataset,'pose')
    for i = 1:size(data.pose,4)
        for j = 1:size(data.pose,3)
            temp_data(:,j,i) = reshape(data.pose(:,:,j,i),[],1);
        end
    end
    training_data = temp_data(:,1:9,:);
    test_data = temp_data(:,10:13,:);
end
end