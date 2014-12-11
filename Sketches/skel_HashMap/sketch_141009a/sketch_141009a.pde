HashMap<Integer,PVector[]> Points = 
        new HashMap<Integer,PVector[]>();
        
  PVector jointPos = new PVector();
  PVector jP = new PVector();
  PVector[] points = new PVector[15];
  for(int i=0; i<15; i++)
  {
      context.getJointPositionSkeleton(userId,i,jointPos);
      context.convertRealWorldToProjective(jointPos, jP);
      //println(i+ ": "+jP);
      points[i] = jP;
  }
  
  Points.put(userId,points);
  
  PVector[] user = Points.get(userId);
  float[] x = new float[user.length]; 
  float[] y = new float[user.length]; 
  for(int i=0; i<user.length; i++)
  {
      PVector part = user[i];
      x[i] = map(part.x,0,600,0,width);
      y[i] = map(part.y,0,600,0,height);
  }

