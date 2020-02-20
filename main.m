
%%
for ki=1:30
SearchAgents_no=30; % Number of search agents

Function_name='F8'; % Name of the test function that can be from F1 to F23

Max_iteration=1000; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
[Best_score1,Best_pos1,Gaussian_curve]=Gaussian(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
[Best_score2,Best_pos2,Levy_curve]=Levy(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
[Best_score3,Best_pos3,cauchy_cg_curve3]=cauchy(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

xx(ki)=Best_score;
xx1(ki)=Best_score1;
xx2(ki)=Best_score2;
xx3(ki)=Best_score3;
end
%compute mean square extension

zz=mean(xx);yy=std(xx);AA=min(xx);
zz1=mean(xx1);yy1=std(xx1);AA1=min(xx2);
zz2=mean(xx2);yy2=std(xx2);AA2=min(xx2);
zz3=mean(xx3);
yy3=std(xx3);
AA3=min(xx3);

%%

%% 
%%
figure('Position',[500 500 660 290])
%%
semilogy(GWO_cg_curve,'Color','r')
title(Function_name)
xlabel('Iteration');
ylabel('Best score obtained so far');


hold on
%hold on

semilogy(Gaussian_curve,'Color','k')
title(Function_name)
xlabel('Iteration');
ylabel('Best score obtained so far');

hold on
semilogy(Levy_curve,'Color','b')
title(Function_name)
xlabel('Iteration');
ylabel('Best score obtained so far');
% 
% hold on

semilogy(cauchy_cg_curve3,'Color','y')
title(Function_name)
xlabel('Iteration');
ylabel('Best score obtained so far');


axis tight
grid on
box on
legend('GWO','Gaussian','levy','cauchy')
display(['The best solution obtained by GWO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective function found by GWO is : ',num2str(Best_score)]);
%%
display(['The best solution obtained by Gaussian Distribution is : ', num2str(Best_pos1)]);
display(['The best optimal value of the objective function found by Gaussian Distribution is : ',num2str(Best_score1)]);
%%
display(['The best solution obtained by Levy Distribution is : ', num2str(Best_pos2)]);
display(['The best optimal value of the objective function found by Levy Distribution is : ',num2str(Best_score2)]);
%%
display(['The best solution obtained by Cauchy Distribution is : ', num2str(Best_pos3)]);
display(['The best optimal value of the objective function found by Cauchy Distribution is : ',num2str(Best_score3)]);
random_walk        



