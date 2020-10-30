# MakersBnB

## User Stories

```As a user```
```So I can use MakersBnB```
```I would like to sign up securely```

```As a user``` 
```So I can rent-out my property short-term```
```I would like to be able to list a property```

```As a user```
```So I can let potential renters know when my property is available```
```I would like to select dates when it is unavailable when making a new listing```

```As a user```
```So I can rent-out multiple properties```
```I want to be able to add multiple properties to the website```

```As a user,```
```So I can look through available properties to rent,```
```I would like would like to see a list of properties ```

```As a user,```
```So that I can properly advertise my property,```
```I want to be able to add a short description of my space and nightly price.```

```As a user```
```So that potential renters cannot rent my property when it is unavailable```
```I would like my property to only list dates that are available to rent```

# How to Run MakersBnB:

1. Clone this repo locally
2. Run ```$ bundle``` 
3. Set up your databases and tables using the steps listed below
4. Run ```$ rackup -p 2345``` from within the MakersBnB directory
5. From Google Chrome go to `localhost:2345`

## Setting Up Your Databases:

1. Go to command line and type `psql`
2. Type: `CREATE DATABASE makers_bnb_manager;`
3. Type: `CREATE DATABASE makers_bnb_manager_test;`

## Setting Up Your User Table:

1. Type `\c makers_bnb_manager`
2. Run the query in the `01_create_user_table.sql` for `makers_bnb_manager`.
3. Repeat steps 1 and 2 for the `makers_bnb_manager_test` database.

## Setting Up Your Property Table:

1. Type `\c makers_bnb_manager`
2. Run the query in the `02_CREATE_PROPERTIES_TABLE.sql` for `makers_bnb_manager`.
3. Repeat steps 1 and 2 for the `makers_bnb_manager_test` database.

# How to Use MakersBnB:

Using MakersBnB is pretty simple. To sign up, use your name and enter a username. If you already have an account, just sign-in using your username.

From here, you will see a list of available properties, and the option to view each one. If you click 'View Property', it will take you to the specific page for that property, where you can choose the date you would like to book. Currently, MakersBnB only allows bookings for one night.

If you would like to list your own property, click 'Add Property' on the first listings page, and go through the sets to add your property.

You can click the 'log out' button to log out at any time.

