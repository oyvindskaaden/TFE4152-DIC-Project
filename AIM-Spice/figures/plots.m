%Plotting script
close all;
clc;

%%
%Loading datafile and allocating variables
doc = load('./simResults/test750_500_250_50@2ms.txt');

t = doc(:,1);
v_erease = doc(:,2);
v_expose = doc(:,3);
v_nrer1 = doc(:,4);
v_nrer2 = doc(:,5);
vout1 = doc(:,6);
vout2 = doc(:,7);
vout_sampled1 = doc(:,8);
vout_sampled2 = doc(:,9);
vout_sampled3 = doc(:,10);
vout_sampled4 = doc(:,11);

%%
%First plot pane
subplot(5, 1, 1);
plot(t*1e3, v_erease, 'r', 'linewidth', 1.5);
axis([0 12 -0.25 2]);
grid;
ylabel('V_{erease} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%Second plot pane
subplot(5, 1, 2);
plot(t*1e3, v_expose, 'r', 'linewidth', 1.5);
axis([0 12 -0.25 2]);
grid;
ylabel('V_{expose} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%Third plot pane
subplot(5, 1, 3);
plot(t*1e3, vout_sampled1, 'r', 'linewidth', 1.5);
hold on;
plot(t*1e3, vout_sampled2, 'b', 'linewidth', 1.5);
plot(t*1e3, vout_sampled3, 'g', 'linewidth', 1.5);
plot(t*1e3, vout_sampled4, 'black', 'linewidth', 1.5);
hold off;
legend('Sampled 1', 'Sampled 2', 'Sampled 3', 'Sampled 4');
axis([0 12 -0.25 1]);
grid;
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%Fourth plot pane
subplot(5, 1, 4);
plot(t*1e3, v_nrer1, ':r', 'linewidth', 2);
hold on;
plot(t*1e3, v_nrer2, ':b', 'linewidth', 2);
hold off;
legend('NRE1','NRE2');
axis([0 12 -0.25 2]);
grid;
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%Fifth plot pane
subplot(5, 1, 5);
plot(t*1e3, vout1, ':r', 'linewidth', 2);
hold on;
plot(t*1e3, vout2, ':b',  'linewidth', 2);
hold off;
axis([0 12 1 2]);
legend('Output 1', 'Output 2');
grid;
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%%
%new figure
figure;
%First plot pane
subplot(5, 1, 1);
plot(t*1e3, v_erease, 'r', 'linewidth', 1.5);
axis([0 12 -0.25 2]);
grid;
ylabel('V_{erease} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%Second plot pane
subplot(5, 1, 2);
plot(t*1e3, v_expose, 'r', 'linewidth', 1.5);
axis([0 12 -0.25 2]);
grid;
ylabel('V_{expose} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%Third plot pane
subplot(5, 1, 3);
plot(t*1e3, vout_sampled1, 'r', 'linewidth', 1.5);
hold on;
plot(t*1e3, vout_sampled2, 'b', 'linewidth', 1.5);
plot(t*1e3, vout_sampled3, 'g', 'linewidth', 1.5);
plot(t*1e3, vout_sampled4, 'black', 'linewidth', 1.5);
hold off;
legend('Sampled 1', 'Sampled 2', 'Sampled 3', 'Sampled 4');
axis([0 12 -0.25 1]);
grid;
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%Fourth plot pane
subplot(5, 1, 4);
plot(t*1e3, v_nrer1, ':r', 'linewidth', 2);
hold on;
plot(t*1e3, v_nrer2, ':b', 'linewidth', 2);
hold off;
legend('NRE1','NRE2');
axis([0 12 -0.25 2]);
grid;
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);


%Fifth plot pane
subplot(5, 1, 5);
plot(t*1e3, vout1, ':r', 'linewidth', 2);
hold on;
plot(t*1e3, vout2, ':b',  'linewidth', 2);
hold off;
axis([0 12 1 2]);
legend('Output 1', 'Output 2');
grid;
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);



%%
%New figure
%First plot pane
figure;
subplot(3, 1, 1);
plot(t*1e3, v_expose, 'r', 'linewidth', 1.5);
axis([0 12 -0.25 2]);
grid;
ylabel('V_{expose} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);
xline(1, '--b');
xline(3.04, '--b','HandleVisibility','off');

%Second plot pane
subplot(3, 1, 2);
plot(t*1e3, v_erease, 'r', 'linewidth', 1.5);
axis([0 12 -0.25 2]);
grid;
ylabel('V_{erease} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%Third plot pane
subplot(3,1,3);
plot(t*1e3, vout_sampled1, 'r', 'linewidth', 1.5);
hold on;
grid;
plot(t*1e3, vout_sampled2, 'b', 'linewidth', 1.5);
plot(t*1e3, vout_sampled3, 'g', 'linewidth', 1.5);
plot(t*1e3, vout_sampled4, 'black', 'linewidth', 1.5);
legend('V_{out sampled 1}','V_{out sampled 2}','V_{out sampled 3}','V_{out sampled 4}')
%title('V_{out sampled} for all 4 pixel cells', 'fontsize', 16);
ylabel('Voltage [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);
xline(1, '--b','HandleVisibility','off');
xline(3.04, '--b', 'HandleVisibility','off');

%%
%Process variations
doc_TT = load('SwitchVdd1.8VVgSweep1.8V_TT.txt');
doc_SS = load('SwitchVdd1.8VVgSweep1.8V_SS.txt');
doc_FF = load('SwitchVdd1.8VVgSweep1.8V_FF.txt');

Vgg_TT = doc_TT(:,2);
gm_TT = doc_TT(:, 3);

Vgg_SS = doc_SS(:, 2);
gm_SS = doc_SS(:, 3);

Vgg_FF = doc_FF(:,2);
gm_FF = doc_FF(:,3);

figure;
plot(Vgg_TT, gm_TT*1e3, 'linewidth', 1.5);
hold on;
plot(Vgg_SS, gm_SS*1e3, 'linewidth', 1.5);
plot(Vgg_FF, gm_FF*1e3, 'linewidth', 1.5);
hold off;
grid;
legend('TT', 'SS', 'FF');
title('Process variations of switch');
ylabel('Transconductance [mS]');
xlabel('Gate voltage [V]');


%%
%Command for exporting vector graphics:
%exportgraphics(gcf,'title.pdf','ContentType','vector'
