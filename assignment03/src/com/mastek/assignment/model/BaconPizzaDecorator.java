package com.mastek.assignment.model;

public class BaconPizzaDecorator extends PizzaDecorator {

	public BaconPizzaDecorator(Pizza decoratedPizza) {
		super(decoratedPizza);
	}
	
	@Override
	public void pizzaBase() {
		decoratedPizza.pizzaBase();
		setBaconTopping(decoratedPizza);
	}
	
	private void setBaconTopping(Pizza decoratedPizza) {
		System.out.println("Topping : Bacon");
	}
	
}
