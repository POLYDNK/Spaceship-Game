/// @desc Setup Variables and Duration

// Object Duration
alarm_set(0, 100); 

// Randomized Drift Distance
xDrift = random_range(-6, 6);
yDrift = random_range(-5, 5);

// Percent of Drift Left to Complete
percent = 1.00;
