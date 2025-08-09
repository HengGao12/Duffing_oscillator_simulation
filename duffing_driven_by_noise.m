%% Nonlinear Duffing Oscillators Driven by Noise
close all;
clc, clear;
rng(42); % random seed

% parameter setting
delta = 0.5;
alpha = -1;
beta = 1;
sigma = 0.1;  % noise intensity

savePath1 = "./figures/duffing_driven_by_noise_sigma_" + num2str(sigma) + "_displacement.png";
savePath2 = "./figures/duffing_driven_by_noise_sigma_" + num2str(sigma) + "_velocity.png";
savePath3 = "./figures/duffing_driven_by_noise_sigma_" + num2str(sigma) + "_phase_portrait.png";

% time parameter
T = 100;       % total time
dt = 0.01;     % time step
N = T / dt;    % total step
t = linspace(0, T, N+1);

% Initialize the state vector
x1 = zeros(N+1, 1);  % displacement
x2 = zeros(N+1, 1);  % velocity


% stochastic disturbance
dW = sqrt(dt) * randn(N, 1);  % Brownian motion

% Euler-Maruyama-based algorithm
for i = 1:N
    x1(i+1) = x1(i) + x2(i) * dt;
    x2(i+1) = x2(i) + ...
        (-delta * x2(i) - alpha * x1(i) - beta * x1(i)^3)*dt + sigma * dW(i);
end

% plot
figure;
plot(t, x1, 'b');
xlabel('Time', 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('Displacement', 'FontName', 'Times New Roman', 'FontSize', 14);
title('Duffing Oscillator Driven by White Noise', 'FontName', 'Times New Roman', 'FontSize', 14);
grid on;
% Set the font name for the tick labels
ax = gca;
ax.XAxis.FontName = 'Times New Roman';
ax.YAxis.FontName = 'Times New Roman';
ax.XAxis.FontSize = 14;
ax.YAxis.FontSize = 14;
print(gcf, savePath1, '-dpng', '-r1200', '-painters');

% plot
figure;
plot(t, x2, 'b');
xlabel('Time', 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('Velocity', 'FontName', 'Times New Roman', 'FontSize', 14);
title('Duffing Oscillator Driven by White Noise', 'FontName', 'Times New Roman', 'FontSize', 14);
grid on;
% Set the font name for the tick labels
ax = gca;
ax.XAxis.FontName = 'Times New Roman';
ax.YAxis.FontName = 'Times New Roman';
ax.XAxis.FontSize = 14;
ax.YAxis.FontSize = 14;
print(gcf, savePath2, '-dpng', '-r1200', '-painters');

figure;
plot(x1, x2, 'b');
xlabel('x', 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('y', 'FontName', 'Times New Roman', 'FontSize', 14);
xlim([-2.0 2.0]); ylim([-3.5 3.5]);
grid on;
% Set the font name for the tick labels
ax = gca;
ax.XAxis.FontName = 'Times New Roman';
ax.YAxis.FontName = 'Times New Roman';
ax.XAxis.FontSize = 14;
ax.YAxis.FontSize = 14;
print(gcf, savePath3, '-dpng', '-r1200', '-painters');