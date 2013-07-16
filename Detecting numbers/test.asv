%%%% Part 2
%%%% .m file in Matlab using cells - Paul Mangiamele

%% read all images

for K=2:9
    str = strcat('num', int2str(K),'.jpg');
eval(['num' int2str(K) ' = imread(''' str ''');'])
end

%% struct element (need to play with a bit...)
SE = strel('square', 3);
SEi = strel('square', 2);
SEii = strel('square', 1);
%% make skeleton preprocess and save (maybe this loop is getting tedious)

for K=2:9
    str = strcat('num', int2str(K));
eval([str 'bw ' ' = im2bw(' str ', .5);'])
eval([str 'neg ' ' = ~' str 'bw;'])
eval(['pullnum' int2str(K) ' = imerode(num' int2str(K) 'neg ,SE);'])
eval(['num' int2str(K) 'fin = ~pullnum' int2str(K) ';'])
eval(['imwrite(num' int2str(K) 'fin, ''num' int2str(K) 'fin.jpg'');'])

end
%% bank images (used auto increment [figureX.jpg..] for sequential figures)
 
bankimage = imread('figure2.jpg');
bankibw = im2bw(bankimage, .5);
bankineg = ~bankibw;
%elim (some) background
bankerd = imerode(bankineg, SEi);
bankdia = imdilate(bankerd, SEi);
imshow(bankdia);

%%

for K=2:9
    str = strcat('~num', int2str(K), 'fin');
eval(['comp' int2str(K) ' = imopen(bankdia, ' str ');'])
eval(['fin' int2str(K) ' = ~comp' int2str(K) ';'])
eval(['check' int2str(K) ' = label2rgb(fin' int2str(K) ',''summer'',''c'');'])
end


%%
end2 = imadd(bankimage, check2);
for K=2:8
eval(['end' int2str(K+1) '= imadd(end' int2str(K) ', check' int2str(K+1) ');'])
end
final = imadd(end8, check9);
imshow(final);
imwrite(final, 'figure2finIII.jpg'); %increment this with to save new file..