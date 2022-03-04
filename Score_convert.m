function data_pro = Score_convert(data)


data_pro = data;
Index = find(data(:,1)>0);
data_pro(Index,1) = data_pro(Index,1) + 1;

if size(data,2) == 4
    Index = find(data(:,1)<0 & data(:,2) == 1);
    data_pro(Index,3) = data_pro(Index,3) + 1;
    
    Index = find(data(:,1)<0 & data(:,2) == 2);
    data_pro(Index,3:4) = data_pro(Index,3:4) + 1;
else
    if size(data,2) == 5
        Index = find(data(:,1)<0 & data(:,2) == 1);
        data_pro(Index,3) = data_pro(Index,3) + 1;
        
        Index = find(data(:,1)<0 & data(:,2) == 2);
        data_pro(Index,3:4) = data_pro(Index,3:4) + 1;
        
        Index = find(data(:,1)<0 & data(:,2) == 3);
        data_pro(Index,3:5) = data_pro(Index,3:5) + 1;
    end
end

data_pro(1,1) = data_pro(1,1) - 1;
data_pro(2,1) = data_pro(2,1) + 1;



% [M,N] = size(data);
% data_pro = [];
% for i = 1:M
%     i
%     temp1 = data(i,:);
%     if (temp1(1)>0) && (temp1(2)==0)                   % number of nodes
%         temp2 = zeros(1,N);
%         temp2(1) = temp1(1);
%         data_pro = [data_pro; temp2];
%     else
%         if (temp1(1)==0) && (temp1(2)>0)               % node 0 and its number of candidates
%             temp1(1) = 1;
%             data_pro = [data_pro; temp1];
%         else
%             if (temp1(1)>0) && (temp1(2)>0)            % node index and number of candidates
%                 temp1(1) = temp1(1)+1;
%                 data_pro = [data_pro; temp1];
%             else
%                 if temp1(2) == 0                          % candidate without parents
%                     data_pro = [data_pro; temp1];
%                 else
%                     if (temp1(2) == 1) && (temp1(3) == 0)
%                         temp1(3) = temp1(3) + 1;
%                         data_pro = [data_pro; temp1];
%                     else
%                         L = length(temp1(1:find(temp1, 1, 'last')));
%                         temp1(3:L) = temp1(3:L) + 1;
%                         data_pro = [data_pro; temp1];
%                     end
%                 end
%             end
%         end
%     end
% end


