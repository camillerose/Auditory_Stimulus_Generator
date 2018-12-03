function initializeHardware


% use instrhwinfo to see what ports are available

PORT='COM1';
RATE=115200;
MySerialPort = serial(PORT,'BAUD',RATE);
fopen(MySerialPort)

end