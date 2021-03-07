import RPi.GPIO as GPIO
from time import sleep
GPIO.setwarnings(False) 
GPIO.setmode(GPIO.BCM)
buzzer=23
GPIO.setup(buzzer,GPIO.OUT)
GPIO.output(buzzer,GPIO.HIGH)
sleep(0.5)
GPIO.output(buzzer,GPIO.LOW)
