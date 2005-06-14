/*
 * Room.java
 *
 * Created on 17 de Outubro de 2002, 22:56
 */

package net.sourceforge.fenixedu.domain;

/**
 * 
 * @author tfc130
 */

public class Room extends Room_Base {

    public String toString() {
        String result = "[SALA";
        result += ", codInt=" + getIdInternal();
        result += ", nome=" + getNome();
        result += ", piso=" + getPiso();
        result += ", tipo=" + getTipo();
        result += ", capacidadeNormal=" + getCapacidadeNormal();
        result += ", capacidadeExame=" + getCapacidadeExame();
        result += "]";
        return result;
    }

    public boolean equals(Object obj) {
        boolean resultado = false;
        if (obj instanceof IRoom) {
            IRoom sala = (IRoom) obj;
            resultado = (getNome().equals(sala.getNome()));
        }
        return resultado;
    }

}