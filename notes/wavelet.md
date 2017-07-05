# Wavelet Notes

### What are Wavelets?
* Functions that decompose data into different frequency components
* Better than forier methods in situations where the signal contains discontinuities and sharp spikes
* Useful in many fields such as image compression, turbulence, human vision, radar, and earthquake prediction

### Overview
* The driving idea behind wavelets are to analyze according to scale
* Fourier discovered that he could superpose sines and cosines to represent other functions
* Wavelets differ because the scale at which you look at a window of data plays a large role
  * Example: a large scale notices gross features while a smaller scale picks up the small features
* Wavelet analysis uses this concept to look at both the gross features and the small details at the same time
* In wavelet analysis we adopt a wavelet prototype function, called an *analyzing wavlet* or *mother wavelet*
  * Temporal analysis is done with a contracted, high-frequency version of this function
  * Frequency analysis is done with a dialated, low-frequency version of this function
* The original signal can be reproduced through a *wavelet expansion* (tweaking the coefficients in a linear combination of the wavelet functions)
* Data operations can be preformed by manipulating the same coefficients
* Proper choice of wavelet functions allow you to get rid of some of these coefficients and create a sparse representation of your data (useful in data compression)

### History
* Work on wavelets began in the 1930s
