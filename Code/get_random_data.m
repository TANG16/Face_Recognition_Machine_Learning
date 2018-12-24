function [training_data,test_data] = get_random_data(dataset_selected)
if dataset_selected == 1
    dataset = 'data';
elseif dataset_selected == 2
    dataset = 'illumination';
elseif dataset_selected == 3
    dataset = 'pose';
end
data = load(strcat('/home/dark_knight/UMD/Courses/ENEE439M/Project1/Data/',dataset,'.mat'));
if strcmp(dataset,'data')
    j = 1;
    for i = 1:3:598
        %% steps to get random 2 images form subset of 3 images for training
        a = [i i+1 i+2];
        % determine how many elements is ten percent
        %numelements = round(0.1*length(a));
        numelements = 2;
        % get the randomly-selected indices
        indices = randperm(length(a));
        indices = indices(1:numelements);
        % choose the subset of a you want
        b = a(indices); %for training data
        c = setdiff(a,b); % for test data
        %% load traing data here in a data structure
        for k = 1:size(b,2)
            training_data(:,k,j) = reshape(data.face(:,:,b(k)),[],1);
        end
        for l = 1:size(c,2)
            test_data(:,l,j) = reshape(data.face(:,:,c(l)),[],1);
        end
        %         x1 = data.face(:,:,b(1));
        %         x1 = reshape(x1,[],1);
        %         x2 = data.face(:,:,b(2));
        %         x2 = reshape(x2,[],1);%reshape to coloumn vector
        %         x = data.face(:,:,c);
        %         x = reshape(x2,[],1);
        %         temp_training_data.x1(:,j) = x1;
        %         temp_training_data.x2(:,j) = x2;
        %         temp_test_data.x(:,j) = x;
        j=j+1;
    end
    %     for m = 1:200
    %         for k = 1:size(b,2)
    %             training_data.x(:,k,m) = temp_training_data.x1(:,j);
    %         end
    %         for l = 1:size(c,2)
    %             test_data.x(:,l,i) = reshape(data.face(:,:,c(l)),[],1);
    %         end
    %     end
elseif strcmp(dataset,'illumination')
    for i = 1:size(data.illum,3)
        a = [1:1:size(data.illum,2)];
        % determine how many elements is ten percent
        %numelements = round(0.1*length(a));
        numelements = 14;
        % get the randomly-selected indices
        indices = randperm(length(a));
        indices = indices(1:numelements);
        % choose the subset of a you want
        b = a(indices); %for training data
        c = setdiff(a,b); % for test data
        %% load traing data here in a data structure
        for j = 1:size(b,2)
            training_data(:,j,i) = data.illum(:,b(j),i);
        end
        for k = 1:size(c,2)
            test_data(:,k,i) = data.illum(:,c(k),i);
        end
    end
elseif strcmp(dataset,'pose')
    for i = 1:size(data.pose,4)
        for j = 1:size(data.pose,3)
            temp_data(:,j,i) = reshape(data.pose(:,:,j,i),[],1);
        end
    end
    for i = 1:size(temp_data,3)
        a = [1:1:size(temp_data,2)];
        % determine how many elements is ten percent
        %numelements = round(0.1*length(a));
        numelements = 9;
        % get the randomly-selected indices
        indices = randperm(length(a));
        indices = indices(1:numelements);
        % choose the subset of a you want
        b = a(indices); %for training data
        c = setdiff(a,b); % for test data
        %% load traing data here in a data structure
        for j = 1:size(b,2)
            training_data(:,j,i) = temp_data(:,b(j),i);
        end
        for k = 1:size(c,2)
            test_data(:,k,i) = temp_data(:,c(k),i);
        end
    end
end
end
