package IntergrationTesting;

import junit.framework.TestCase;

public class Intergrationesting extends TestCase {

    public Actionwords actionwords = new Actionwords();
    public void userLoginIncorrect() {
        // TODO: Implement action: "Given User enters invalid username"
        // TODO: Implement action: "and invalid password"
        // TODO: Implement action: "then app redirects to login error page"
        // TODO: Implement result: "and Displays error message"
        throw new UnsupportedOperationException();
    }

    public void testUserLoginIncorrect() {
        userLoginIncorrect();
    }



    public void testUserLoginCorrect() {
        // TODO: Implement action: "Given user enters valid password"
        // TODO: Implement action: "and user enters valid username"
        // TODO: Implement action: "then app redirects to loginsuccess page"

        throw new UnsupportedOperationException();
    }

    public void testAdminLoginIncorrect() {
        // TODO: Implement action: "Given Admin enters invalid username"
        // TODO: Implement action: "and Admin enters invalid Password"
        // TODO: Implement action: "Then App redirects to loginerror page"
        // TODO: Implement action: "and displays error"

        throw new UnsupportedOperationException();
    }

    public void testAdminLoginCorrect() {
        // TODO: Implement action: "Given Admin enters valid username"
        // TODO: Implement action: "and Admin enters valid password"
        // TODO: Implement action: "then app redirects to admin menu"

        throw new UnsupportedOperationException();
    }

    public void testUserRegisterCorrect() {
        // TODO: Implement action: "Given user enters valid information"
        // TODO: Implement action: "and user information passes validation"
        // TODO: Implement action: "and user selects register"
        // TODO: Implement action: "then app creates member in database"
        // TODO: Implement action: "and app redirects to login page"

        throw new UnsupportedOperationException();
    }

    public void testUserRegisterIncorrect() {
        // TODO: Implement action: "Given User enters invalid information"
        // TODO: Implement action: "and User information didnt pass validation
        // "
        // TODO: Implement action: "then app displays message fill "

        throw new UnsupportedOperationException();
    }

    public void testUserTryYoCreateAccountWithExistingUsername() {
        // TODO: Implement action: "Given User enter valid information"
        // TODO: Implement action: "and information passes validation"
        // TODO: Implement action: "and app checks if username exists"
        // TODO: Implement action: "then app redirects to error page"
        // TODO: Implement action: "and app displays message"

        throw new UnsupportedOperationException();
    }

    public void testEditProfileCorrect() {
        // TODO: Implement action: "Given User is in the edit profile page      "
        // TODO: Implement action: "and User changes some details in the text boxes      "
        // TODO: Implement action: "and user selects submit button      "
        // TODO: Implement action: "then user edits member in database      "
        // TODO: Implement action: "and app redirects to edit profile page "

        throw new UnsupportedOperationException();
    }

    public void testEditProfileIncorrect() {
        // TODO: Implement action: "Given user is in edit profile page"
        // TODO: Implement action: "and user edits details in text boxes"
        // TODO: Implement action: "and information is invalid"
        // TODO: Implement action: "then app redirects to error page"
        // TODO: Implement action: "and Displays message"

        throw new UnsupportedOperationException();
    }

    public void testUploadProfilePicture() {
        // TODO: Implement action: "Given user is in edit profile page"
        // TODO: Implement action: "and user selects upload photo "
        // TODO: Implement action: "and app shows windows explorer"
        // TODO: Implement action: "then user selects picture"
        // TODO: Implement action: "and app edits Avatar in members table DB"
        // TODO: Implement action: "and app redirects to edit page"

        throw new UnsupportedOperationException();
    }

    public void testAddToCart() {
        // TODO: Implement action: "Given user selects album buy"
        // TODO: Implement action: "and app redirects to album detail page"
        // TODO: Implement action: "and user enters amount he wants"
        // TODO: Implement action: "then user selects add to cart"
        // TODO: Implement action: "and app adds the items to cart"
        // TODO: Implement action: "and app redirects to home page"

        throw new UnsupportedOperationException();
    }

    public void testAddToCartNotEnoughInStock() {
        // TODO: Implement action: "Given user selects album buy"
        // TODO: Implement action: "and app redirects to album detail page"
        // TODO: Implement action: "and user enters amount he wants"
        // TODO: Implement action: "then user selects add to cart"
        // TODO: Implement action: "and App redirect to error page"
        // TODO: Implement action: "and Displays message"

        throw new UnsupportedOperationException();
    }

    public void testPurchaseItemsCorrect() {
        // TODO: Implement action: "Given user is in adlum detail"
        // TODO: Implement action: "and user enters the quantity"
        // TODO: Implement action: "then user selects buy now"
        // TODO: Implement action: "and app inserts to order to DB
        // "

        throw new UnsupportedOperationException();
    }

    public void testPurchaseItemsIncorrect() {
    }
}