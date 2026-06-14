# What it does

This is a 6-wheeled driverless car. Using an Ultrasonic sensor as the main sensor, it detects any object and instantly changes its path to avoid the obstacle. The motor driver used is an L293D motor driver. This entire automation is powered by the high-performance VSD Squadron FPGA Mini.

## 📺 Project in Action

Click the image below to watch the full demonstration video on YouTube:

[![Watch the 6-Wheeled Autonomous Car Demo](https://youtube.com)](https://youtube.com/shorts/ri6kvbogaF0)

---

## 🚀 Features & Highlights

* **6-Wheel Drive Layout**: Built with a robust multi-wheel chassis for superior stability, grip, and smooth maneuvering across flat surfaces.
* **Real-Time Obstacle Avoidance**: Utilizes an ultrasonic sensor array that constantly pings the environment, creating a reliable, touch-free collision avoidance system.
* **Hardware-Level Control**: Programmed on the **VSD Squadron FPGA Mini**, unlocking ultra-low latency decision-making and parallel processing that traditional microcontrollers cannot match.
* **Reliable Power Delivery**: Driven by the dependable **L293D IC**, ensuring stable dual-bridge current distribution to handle multiple motors simultaneously.

## 🛠️ Tech Stack & Components

* **Brain**: VSD Squadron FPGA Mini 
* **Sensor**: HC-SR04 Ultrasonic Sensor
* **Actuation**: L293D Motor Driver Shield + 6 DC Motors
* **Power**: Independent battery source for logic and motors
