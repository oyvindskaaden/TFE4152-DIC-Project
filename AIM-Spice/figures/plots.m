%Plotting script
close all;
clc;

%%
%Loading datafile and allocating variables
doc = load('test750p2m.txt');

t = doc(:,1);
v_erease = doc(:,4);
v_expose = doc(:,3);
v_nre1r1 = doc(:,5);
vout_sampled = doc(:,6);
vout = doc(:,7);

%%
%First plot pane
subplot(5, 1, 1);
plot(t*1e3, v_erease, 'r', 'linewidth', 1.5);
axis([0 12 -0.5 2]);
grid;
ylabel('V_{erease} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%%
%First plot pane
subplot(5, 1, 2);
plot(t*1e3, v_expose, 'r', 'linewidth', 1.5);
axis([0 12 -0.5 2]);
grid;
ylabel('V_{expose} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%%
%First plot pane
subplot(5, 1, 4);
plot(t*1e3, v_nre1r1, 'r', 'linewidth', 1.5);
axis([0 12 -0.5 2]);
grid;
ylabel('V_{nre1r1} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%%
%First plot pane
subplot(5, 1, 5);
plot(t*1e3, vout, 'r', 'linewidth', 1.5);
axis([0 12 0 2]);
grid;
ylabel('V_{out} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%%
%First plot pane
subplot(5, 1, 3);
plot(t*1e3, vout_sampled, 'r', 'linewidth', 1.5);
axis([0 12 -0.5 1.5]);
grid;
ylabel('V_{out sampled} [V]', 'fontsize', 14);
xlabel('Time [ms]', 'fontsize', 14);

%%
%Command for exporting vector graphics:
%exportgraphics(gcf,'node_voltages_@_Id750_and_texp2ms.pdf','ContentType','vector'
