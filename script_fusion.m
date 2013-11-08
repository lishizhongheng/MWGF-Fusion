% script_fusionOthers.m
% -------------------------------------------------------------------
% 
% Date:    10/04/2013
% Last modified: 1/11/2013
% -------------------------------------------------------------------

function script_fusion()

%     clear
    clc

    %% ------ Input the images ----------------
    % ------------- The Gray ----------------
    path1 = '.\image\clock_A.bmp';
    path2 = '.\image\clock_B.bmp';
%     path1 = '.\image\book_A.bmp';
%     path2 = '.\image\book_B.bmp';
%     path1 = '.\image\flower_A.png';
%     path2 = '.\image\flower_B.png';
%     path1 = '.\image\disk_A.tif';   
%     path2 = '.\image\disk_B.tif';
%     path1 = '.\image\lab_A.tif';
%     path2 = '.\image\lab_B.tif';
%     path1 = '.\image\pepsi_A.tif';
%     path2 = '.\image\pepsi_B.tif';
    % -------------- The color -----------------  
%     path1 = '.\image\temple_A.bmp';
%     path2 = '.\image\temple_B.bmp';
% 
%     path1 = '.\image\seascape_A.bmp';
%     path2 = '.\image\seascape_B.bmp';
% % %
    % -----------------------------------------
    [img1, img2, imgName] = PickName(path1, path2, 0);
    paraShow.title = 'Org1';
    ShowImageGrad(img1, paraShow)
    paraShow.title = 'Org2';
    ShowImageGrad(img2, paraShow)
    %% ---- The parameter -----
    % ------------- the Large Scale ---------
    para.LScale.sigma = 4;
    para.LScale.alpha = 0.5;
    % ----------- the Small Scale -----------
    para.SScale.sigma = 0.5;
    para.SScale.alpha = 0.5;
    % -------------- the prune parameter -------------
    para.Prune.per = 0.1;
    para.Prune.show = 1;
    % ------------- the recover parameter -----------
    para.Rec.iter = 1000;
    para.Rec.res = 1e-6;
    para.Rec.modify = 5;
    para.Rec.iniMode = 'weight';   
    
    %% ---- Fusion and the result ------
    imgRec = MWGFusion(img1, img2, para);

    % --- Show the result ------
    paraShow.title = 'MWGF';
    ShowImageGrad(imgRec, paraShow);
    saveas(gcf, [imgName 'mwgf'], 'bmp');
   
end
