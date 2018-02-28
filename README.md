# wireless - SDR
The file for the SDR assignment has been uploaded.
rtl_sdr -s 2400000 -f 101500000 -g25 capture.bin -> This command is used to capture the audio and we stop recording in 5 seconds.
101.5MHz is the frequency of Sky Radio.
We can call the function with the following parameters:
FM_demod(loadFile('capture1.bin'),60000,10,15000,5,2400000);
