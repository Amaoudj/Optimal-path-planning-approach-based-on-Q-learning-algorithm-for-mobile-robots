function PathSmoothingSample()

%path smoothing with gradient method

clear all;
close all;

path=[0 0;
      1 0;
      2 0;
      3 0
      3 1
      3 2
      3 3
      3 4
      4 4
      5 4
      6 4];
  
optPath=PathSmoothing(path);
  
plot(path(:,1),path(:,2),'-.b');hold on;
plot(optPath(:,1),optPath(:,2),'-or');hold on;
axis([-1 7 -2 6])
legend('Before','After');
title('Path Smoothing');
grid on;

end

function optPath=PathSmoothing(path)
optPath=path;%���̃p�X���R�s�[

%�������p�����[�^
alpha=0.5;
beta=0.2;

torelance=0.00001;%�p�X�̕ω��ʂ�臒l(�ω��ʂ����̒l�ȉ��̎����������I��)
change=torelance;%�p�X�̈ʒu�̕ω���
while change>=torelance 
    change=0;%������
    for ip=2:(length(path(:,1))-1) %�n�_�ƏI�_�͌Œ�
        prePath=optPath(ip,:);%�ω��ʌv���p
        optPath(ip,:)=optPath(ip,:)-alpha*(optPath(ip,:)-path(ip,:));
        optPath(ip,:)=optPath(ip,:)-beta*(2*optPath(ip,:)-optPath(ip-1,:)-optPath(ip+1,:));
        change=change+norm(optPath(ip,:)-prePath);
    end
end

end