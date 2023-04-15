import machine
import time
led_onboard = machine.Pin(25, machine.Pin.OUT)

for i in [1, 0.1, 0.3]:
    time.sleep(i)
    led_onboard.on()
    time.sleep(0.1)
    led_onboard.off()



exec(open("keyz/read.py").read())