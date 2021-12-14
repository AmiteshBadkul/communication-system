# About
This folder contains the assignment files.

## Assignment 1 
Below is a list of communication standards used across many commonly used devices and services. From the list, you are required to select Three standards based on the last Three numbers in your institute ID
number. For example, if your ID number is 2010AAPS1234H, you are required to select topics 2,3 and 4 from the list i.e., IEEE 802.11/n, IEEE 802.11/a and IEEE 802.11/c respectively.
For each of the selected topics you are required to submit a write-up (not exceeding ONE page) consisting of the following details.
● Introduction
● Type of Channel used
● Range of Frequencies used
● Modulation Type(s) involved
● Salient Features
List of Communication Standards:
0. IEEE 802.11/b
1. IEEE 802.11/g
2. IEEE 802.11/n
3. IEEE 802.11/a
4. IEEE 802.11/c
5. IEEE 802.15 (relationship between Zigbee and this standard must be explained)
6. IEEE 802.157
7. IEEE 802.3
8. IEEE 802.11/p
9. IEEE 802.15 (relationship between Bluetooth and this standard must be explained)

## Assignment 2
Write a MATLAB program to take user inputs (via a GUI) and implement the different
variations of amplitude modulation and demodulation for different channel configurations.
User Inputs to be taken:
1. Message signal as a .txt file to be placed in the same folder as the main .m (or .mlapp)
code. The text file will contain two columns: the first column contains the time index in an
increasing order (in uniform time steps) while the second column corresponds to the
amplitude of the message for the corresponding time index. Message signal is the only user
input that need not be accepted with the help of GUI.
2. Type of AM modulation
a. DSB-C
b. DSC-SC
c. SSB-USB
d. SSB-LSB
3. Type of channel
a. Ideal lossless, noiseless channel
b. Lossy, noiseless channel
c. Lossless channel with Additive White Gaussian noise (AWGN)
d. Lossy, AWGN channel
For the AWGN channel, the noise is to be taken as zero mean and unit variance. Here,
the term “lossy” refers to a degradation in signal power by 3 dB across all frequencies.
4. Type of Demodulation
a. Synchronous detector
b. Envelope detector (Choose appropriate values of RC)
c. Square-law detector (Choose an appropriate input-output characteristics)
Values to be calculated:
1. Suitable carrier frequency based on the message signal. Assume a sampling
frequency of 10 times the carrier frequency.
2. Plot message signal in time and frequency domains
3. Plot modulated signal in time and frequency domains
4. Plot demodulated signal and compare it with the original message signal, and
calculate the SNR (where applicable)
