-- Count How many actors are in the tables

SELECT COUNT(*) FROM actors;

-- try to add new actor with some blank fields

INSERT INTO public.actors(
	first_name, last_name, age, number_oscars)
	VALUES ('Test Null Actor', 'Test Last Name Actor',2);

-- The outcoome should be Error, As we have all field NOT NULL, 
-- ERROR:  INSERT a plus de colonnes cibles que d'expressions
-- LINE 2:  first_name, last_name, age, number_oscars)
                                     ^ 

-- ERREUR:  INSERT a plus de colonnes cibles que d'expressions
-- SQL state: 42601