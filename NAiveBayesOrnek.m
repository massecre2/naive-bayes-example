N1=[4,4];
N2=[9,9];

sinif1=repmat(N1,500,1)+randn(500,2);
sinif2=repmat(N2,500,1)+randn(500,2);

etiket1=ones(500,1);
etiket2=2*ones(500,1);

tumSiniflar=[sinif1;sinif2];
tumEtiketler=[etiket1;etiket2];

gscatter(tumSiniflar(:,1),tumSiniflar(:,2),tumEtiketler,'rb','+*');

model=fitcnb(tumSiniflar,tumEtiketler);

etiketp=predict(model,tumSiniflar);

oran=sum(etiketp==tumEtiketler)/length(tumEtiketler)*100

[X,Y]=meshgrid(-3:0.2:20);
mu1=mean(sinif1);
std1=std(sinif1);

Z=1/sqrt(2*pi)*norm(std1)*...
    exp((-(X-mu1(1)).^2-(Y-mu1(2)).^2)/(2*norm(std1)));

hold on;
surf(X,Y,Z,'FaceAlpha',0.2,'FaceColor','r');
hold off;

mu2=mean(sinif2);
std2=std(sinif2);

Z=1/sqrt(2*pi)*norm(std2)*...
    exp((-(X-mu2(1)).^2-(Y-mu2(2)).^2)/(2*norm(std2)));

hold on;
surf(X,Y,Z,'FaceAlpha',0.2,'FaceColor','b');
hold off;




