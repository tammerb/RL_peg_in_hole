# RL_peg_in_hole

This project trains an agent to perform peg in hole insertion on a UR5e robotic arm in robo-gym.

Depends on https://github.com/jr-robotics/robo-gym and https://github.com/jr-robotics/robo-gym-robot-servers/tree/v0.1.0.

Running the example:
- Spin up the docker-compose
- In the Robot Server terminal, run `start-server-manager`
- In the Environment Server, navigate to the `environments` directory and run `python3 random_ur5e_agent.py`