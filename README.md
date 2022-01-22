# ADRx

This is simulator is based:  
Marini, R.; Mikhaylov, K.; Pasolini, G.; Buratti, C. LoRaWANSim: A Flexible Simulator for LoRaWAN Networks. Sensors 2021, 21, 695. https://doi.org/10.3390/s21030695 
which is openly avialable from: https://www.mdpi.com/1424-8220/21/3/695/htm

Step 1: select mode
  
 ---- mode 1: simulator uses LoRaWAN's ADR
  
 ---- mdde 2: simulator uses ADRx
  
 ---- mode 3: no ADR, same SF for al EDs
  
 ---- mode 0: use this to gather data per cell. creates annulus regions described in input.csv

Step 2: edit input csv

 ---- edit R, S, P, C, N.
