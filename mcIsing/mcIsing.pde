import java.math.*;
import java.util.Random;
final int n = 300;
int[][] grid;
final float b = 0.4;
Random r;


void setup() {
  r = new Random();
  size(n,n);
//  background(0);
  grid = new int[n][n];
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      grid[i][j] = (int)pow(-1,i+j);
    }
  }
  for (int i=0; i<100; i++) {
    mcSim();
  }
}

void draw() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      //stroke(grid[i][j]);
      if (grid[i][j]==1)  {
        stroke(255);
        point(i,j);
      }
      else {
        stroke(0);
        point(i,j);
      }
    }
  }
  mcSim();
}

void mcSim() {
  int x,y, diff;
  double rand;
 for (int i=0; i<3*n*n; i++) {
  x = r.nextInt(n);
  y = r.nextInt(n);
  diff = 2*grid[x][y]*(grid[mod(x+1,n)][y] + grid[mod(x-1,n)][y] + 
  grid[x][mod(y+1,n)] + grid[x][mod(y-1,n)]);
  rand = r.nextFloat();
  if (diff>0) {
   if (Math.exp(-diff*b)>rand) {
     grid[x][y] = -grid[x][y]; 
    }
  }
  else {
    grid[x][y] = -grid[x][y];
  }
 } 
}

int mod(int a, int b) {
 return (a%b + b)%b; 
}
