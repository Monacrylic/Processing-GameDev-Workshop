# Hardware Game Developmemnt Workshop - Part 1
This is the primary repository for the Hardware-Game-Dev Workshop conducted by Technotix on 25th/31st of October 2020.


## Assign a game to yourself, to avoid duplication

1) Flappy Bird - Siddharth Kothari
2) Brick Breaker 
3) Avoid the obstacles
4) Pong 
5) Dino Run
6) WaveLine
Or any other game that would use only the mouse or arrowkeys for control.


## Processing Code Best Practices

1) Have one .pde file which contains only the setup and draw function named as <name_of_the_game.pde>

2) Create a class for every object in the game. For instance in brick-breaker, you should have classes for Brick, Paddle and Ball.

3) Name the variables properly, and follow camelCasing throughout!

4) Try to minimize hardcoded values, by specifying distace paramenters relative to height and width of the screen like width/2 or height/someVariable.
