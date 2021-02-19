package com.codegym.thang;
public class Calculator {
    public static double calculate(double firstOperand, double secondOperand, char operator){
        switch (operator) {
            case '+':
                return  firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*' :
                return firstOperand * secondOperand;
            case '/' :
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException(" not division by zero!");
                 default:
                throw new RuntimeException("invalid operation !");
            }
        }
    }
