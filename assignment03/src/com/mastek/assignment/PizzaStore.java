package com.mastek.assignment;

import com.mastek.assignment.model.BaconPizzaDecorator;
import com.mastek.assignment.model.DetroitPizza;
import com.mastek.assignment.model.PepperoniPizza;
import com.mastek.assignment.model.Pizza;

public class PizzaStore {

	public static void main(String[] args) {
		Pizza detroitpizza= new DetroitPizza();
		Pizza pepperonipizza= new PepperoniPizza();
		Pizza bacondetroidpizza= new BaconPizzaDecorator(new DetroitPizza());
		Pizza baconpepperonipizza= new BaconPizzaDecorator(new PepperoniPizza());
		
		System.out.println("Calling the base pizza only");
		detroitpizza.pizzaBase();
		pepperonipizza.pizzaBase();
		System.out.println();
		
		System.out.println("Calling the base pizza with toppings");
		bacondetroidpizza.pizzaBase();
		System.out.println();
		baconpepperonipizza.pizzaBase();

	}

}
