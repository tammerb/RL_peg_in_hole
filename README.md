# RL_peg_in_hole

This project trains an agent to perform peg in hole insertion on a UR5e robotic arm in robo-gym.

Depends on https://github.com/jr-robotics/robo-gym and https://github.com/jr-robotics/robo-gym-robot-servers/tree/v0.1.0.

Running the example:
- Spin up the docker-compose
- In the Robot Server terminal, run `roslaunch mir100_robot_server sim_robot_server.launch gui:=true`
- In the Environment Server, run 