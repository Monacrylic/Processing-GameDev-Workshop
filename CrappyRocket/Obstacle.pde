class Obstacle {
  public
	float leftVal, rightVal, y, height;
	color obstacleColor;

	Obstacle(float leftVal, float rightVal, float y, float height, color obstacleColor) {
		this.leftVal = leftVal;
		this.rightVal = rightVal;
		this.y = y;
		this.height = height;
		this.obstacleColor = obstacleColor;
	}


	void drawObstacle() {
		fill(this.obstacleColor);
    strokeWeight(3);
		rect(0, y, leftVal, this.height);
		rect(rightVal, y, width, this.height);
	}
}
