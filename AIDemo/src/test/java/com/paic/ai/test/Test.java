package com.paic.ai.test;

public class Test {

    public static void main(String[] args) {
       int x = 10;
       int y = x;
       System.out.println("before x++,x="+x);
       x++;
       System.out.println("after x++,x="+x);
       x = x+1;
       System.out.println("x=" + x +",y="+y);
    }

}
