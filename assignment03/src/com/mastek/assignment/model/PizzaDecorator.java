package com.mastek.assignment.model;

public abstract class PizzaDecorator implements Pizza {

	protected Pizza decoratedPizza;

	public PizzaDecorator(Pizza decoratedPizza) {
		super();
		this.decoratedPizza = decoratedPizza;
	}
	
	public void pizzaBase(){
		decoratedPizza.pizzaBase();
	}
	
}
