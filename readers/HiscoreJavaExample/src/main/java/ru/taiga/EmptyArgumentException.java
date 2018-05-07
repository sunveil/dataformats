package ru.taiga;

class EmptyArgumentException extends Exception{
    EmptyArgumentException(){}
    EmptyArgumentException(String message){
        super(message);
    }
}