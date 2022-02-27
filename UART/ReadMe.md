# UART implementation on FPGA

**The implemented UART hardware, the bit width of the data to be transferred,the baud rate value of the communication, the length and logic value of the stop bit,
and the 'even' and 'odd' states of the parity bit were programmed with a 'generic' language.** <br />

**Generic Variables**  <br />

<br />       bitNumber : integer   := 8 ;
<br />		   baudRate  : integer   := 9600;
<br />		   parity    : std_logic := 'U' ;     
<br />		   stopBits  : integer   := 1;
<br />		   stopLogic : std_logic := '1';
<br />		   clockFreq : integer   := 100_000_000

<br />**bitNumber:** Number of bits to be transferred at once
<br />**baudRate:** Baud rate of Uart Module
<br />**parity:** Parity enable(Even or Odd)/disable.  Set 0 ==> Even Set 1 ==> Odd Set 'U' ==> disable parity
<br />**stopBits:** Length of stop bit . Generally, in uart system, this is 1 bit. But it can be 2 bits.
<br />**stopLogic:** Logic state of stop bit. '0' or '1' can be setted.
<br />**clockFreq:** : System main clock frequency.

## TESTS

**TX Buffer:**

![TxBuf_1](https://user-images.githubusercontent.com/34924065/155885129-d7d6e486-e442-4e4f-a501-17b67cd666ee.PNG)


### Test-1

**Configuration of UART**

![CFG1](https://user-images.githubusercontent.com/34924065/155885020-d72512e3-fa60-4d3f-8f34-6905a0777024.PNG)

**Transmit Process of UART**

![Tx_1](https://user-images.githubusercontent.com/34924065/155885083-268cd75d-173d-4b71-8aca-533532fa3088.PNG)

**Receive Process of UART**

![Rx_1](https://user-images.githubusercontent.com/34924065/155885093-871095b6-b303-4e72-9477-2799bfc249c1.PNG)

### Test-2

**Configuration of UART**

![CFG2](https://user-images.githubusercontent.com/34924065/155885222-923dfb4d-4c8a-46e8-bbcb-bba73be560f0.PNG)

**Transmit Process of UART**

![TX_2](https://user-images.githubusercontent.com/34924065/155885234-b073275b-e48f-4b6f-85c2-a6f57b0a6f47.PNG)

**Receive Process of UART**

![RX_2](https://user-images.githubusercontent.com/34924065/155885244-05994c60-c16f-4e27-a8bb-ecee2b4eaf42.PNG)

### Test-3

**Configuration of UART**

![CFG3](https://user-images.githubusercontent.com/34924065/155885254-476bb89c-2c58-42f9-8b4e-6be45c7f0531.PNG)

**Transmit Process of UART**

![Tx_3](https://user-images.githubusercontent.com/34924065/155885259-144b0b79-594f-42e8-8eaf-fe75bea2d54f.PNG)

**Receive Process of UART**

![RX_3](https://user-images.githubusercontent.com/34924065/155885273-cc6b9421-2de0-4cea-b2b0-2fa8c9dbfda4.PNG)



