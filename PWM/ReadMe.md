# PWM implementation on FPGA

In this design, in/outs are them:
- freq
- dutyCycle
- enable PWM
- outPWM

You can set this variables whatever and whenever you want.

# TESTS

## Test-1
**Frequency : 1000 Hz** <br />
**Duty Cycle: 0-100** <br />

<br /> **Period : 1s / 1000 = 1 mS**
<br /> **Duty:** <br />
    Assume 15 => High Time: Period* duty/100 = 1 ms * 15 / 100 = 150 uS <br />
![PWM1](https://user-images.githubusercontent.com/34924065/155883479-a672a914-e73e-46b7-9031-6d39ab8a6223.PNG)

## Test-2


Frequency : 20 kHz
Duty Cycle: 0-100

Period : 1s / 20000 = 50 us
![PWM2](https://user-images.githubusercontent.com/34924065/155883491-6384d49a-043d-4d7f-9066-87383d19ad63.PNG)
