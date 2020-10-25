class Obstacle {
  public
	float leftVal, rightVal, y, height;
	color obstacleColor;

	Obstacle(float leftVal, float rightVal, float y, float height) {
		this.leftVal = leftVal;
		this.rightVal = rightVal;
		this.y = y;
		this.height = height;
		this.obstacleColor = obstacleColor;
	}


	void drawObstacle() {
		fill(obstacleColor);
		rect(0, y, leftVal, this.height);
		rect(rightVal, y, width, this.height);
	}
}
