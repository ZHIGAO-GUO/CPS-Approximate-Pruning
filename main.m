clc
clear
tic
filename_set = {'asia-n-0.1k';'asia-n-1k';'asia-n-10k';'asia-n-100k';'asia-n-1000k';'alarm-n-0.1k';'alarm-n-1k';'alarm-n-10k';'alarm-n-100k';'alarm-n-1000k';'formed-n-0.1k';'formed-n-1k';'formed-n-10k';'formed-n-100k';'formed-n-1000k';'property-n-0.1k';'property-n-1k';'property-n-10k';'property-n-100k';'property-n-1000k';'sports-n-0.1k';'sports-n-1k';'sports-n-10k';'sports-n-100k';'sports-n-1000k';}
length(filename_set)
for f = 1:length(filename_set)
    filename = filename_set{f}
    data_pro = dlmread([filename, '.jkl']);
    data_pro = Score_convert(data_pro);
    [Node_num,Node_loc,Node_info,Cell] = index_identification(data_pro);
    
    for rate = 0.1:0.1:1      % Sampling percentage
        for i = 1:Node_num
            Num = round((size(Cell{i},1)-1)*rate);
            a = Cell{i};
            if rate == 1
                b = a;
            else
                if max(1,Num) == 1
                    b = a;
                else
                    b = [a(1:(Num+1),:); a(end,:)];
                    b(1,2) = Num+1;
                end
            end
            Cell_new{i} = b;
        end
        fid=fopen([filename, '-prunded-',num2str(rate),'.jkl'],'w');
        fprintf(fid,'%d\n',Node_num);
        for i = 1:size(Cell_new,2)
            temp = Cell_new{i};
            fprintf(fid,'%d ',temp(1,1)-1);
            fprintf(fid,'%d\n',temp(1,2));
            for j = 2:size(temp,1)
                temp1 = temp(j,:);
                if (temp1(1)>0) && (temp1(2)>0)                            % node index and number of candidates
                    fprintf(fid,'%d ',temp1(1)-1);
                    fprintf(fid,'%d\n',temp1(2));
                else
                    if temp1(2) == 0                                       % candidate without parents
                        fprintf(fid,'%10.8f ',temp1(1));
                        fprintf(fid,'%d\n',temp1(2));
                    else                                                   % candidate with parents
                        temp2 = temp1(1:find(temp1, 1, 'last'));
                        fprintf(fid,'%10.8f ',temp2(1));
                        fprintf(fid,'%d ',temp2(2));
                        fprintf(fid,'%d ',temp2(3:(end-1))-1);
                        fprintf(fid,'%d\n',temp2(end)-1);
                    end
                end
            end
        end
    end
end
    
    
    








