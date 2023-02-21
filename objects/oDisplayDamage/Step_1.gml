/// @desc Drift in a Random Direction

percent = max(0, percent - max((percent / 10), 0.005));

x += (xDrift * percent);
y += (yDrift * percent);
