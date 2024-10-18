function Iwbg = rmbg(I)
    % Display original image
    figure(1)
    subplot(2,2,1)
    imshow(I)
    title('Original image','FontSize',16)

    % Convert to grayscale
    Igray = rgb2gray(I);
    subplot(2,2,2)
    imshow(Igray)
    title('Grayscale image','FontSize',16)

    % Generate binary alpha channel
    [r,c] = size(Igray);
    Ialpha = ones(r,c); 
    Ialpha(Igray > max(Igray)-5) = 0; 
    subplot(2,2,4)
    imshow(Ialpha)
    title('Binary alpha channel of the image','FontSize',16)

    % Save the result with background removed
    imwrite(I, "withoutbg.png", 'Alpha', Ialpha);

    % Display the result
    Iwbg = imread('withoutbg.png');
    figure(2)
    imshow(Iwbg)
    title('Resultant image with transparent background','FontSize',16)
end
