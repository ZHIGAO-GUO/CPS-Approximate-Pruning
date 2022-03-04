function [Node_num,Node_loc,Node_info, a_cell] = index_identification(a)

index = find(a(:,3)==0 & a(:,1)>0);
Node_num = a(index(1),1);             % node number in data
Node_loc = index(2:end);             % location of node name in data
Node_info = a(Node_loc,:);           % node information

for i = 1:Node_num
    if i == Node_num
        a_cell{i} = a(Node_loc(i):end,:);
    else
        a_cell{i} = a(Node_loc(i):Node_loc(i+1)-1,:);
    end
end
