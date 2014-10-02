Feature: User login through app
      In order to view my account summary
	  As a user
  	  I want to successfully log to my account through app

Scenario: User has ability to login their account through app
 #Note: under the ability we need to verify username, password, signin button in our step definition, this
 #is only view of those field and button)
  
  Given I have an Captown bank app is running
  When I go to the login page
  Then I should see the ability to login my account

 

Scenario Outline: Authorized User can login their account through iPad app
	Given I am on the login page as an authorized user
	When I am accessing to account with valid <username> and <password>
	Then I should see my account summary

	Examples:
	| username | password  |
	| user1    | abcd12345 |
	| user2    | 1234abcd |


Scenario Outline: Un-authorized User can not go to account summary page
	Given I am on the login page as an un-authorized user
	When I accessing to account with invalid <username> and <password>
	Then I should redirect to access denied page with error this <message>

	Examples:
	| username           | password  | message                   |
	| validUserNaem      | invalidPW | use the standard message  |
	| invaliduserName    | validPW   | use the standard message  |
	| invaliduserName    | invalidPW | use the standard message  |


Scenario Outline: Blocked User can not go to account summary page
 #If there any scenair for block account
	Given I am on the login page as a blocked user
	When I accessing to account with blocked <usrename> and <password>
	Then I should see message to contact representative

	Examples:
	| userName | password  |
	| user3    | abcde1234 |
	| user4    | 12345abcd |



Scenario Outline: UserName and Password validation as per rules
#if we have rule say, user name should have atleast 1 Cap letter, 1 number, 1 lower case letter, atlest 8 character, no special character.
#For password atleast 1 Cap letter, 1 number, 1 lower case letter, atlest 8 character etc......)

	Given I am on the login page as an user
	When I using <username> and <password> out of the validation rule
	Then I should see inline error <message>

	Examples:
	| username           | password  | message                   |
	| validUserNaem      | invalidPW | use the standard message  |
	| invaliduserName    | validPW   | use the standard message  |
	| invaliduserName    | invalidPW | use the standard message  |

