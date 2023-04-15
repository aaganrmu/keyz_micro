import machine
import time
led_onboard = machine.Pin(25, machine.Pin.OUT)
led_onboard.on()
time.sleep(0.5)
led_onboard.off()
time.sleep(0.5)