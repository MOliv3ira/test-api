package steps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import pojo.QaUser;
import services.APIService;

import java.util.HashMap;

public class APISteps {

    private QaUser qaUser;
    private APIService apiService;

    @Given("the user wants to create a new user")
    public void theUserWantsToCreateANewUser() {
         qaUser = new QaUser();
         apiService = new APIService();
    }

    @And("the user fills field {string} with value equal {string}")
    public void theUserFillsFieldWithValueEqual(String field, String value) {
        apiService.fillFields(qaUser, field, value);
    }

    @When("the user saves new user")
    public void theUserSavesNewUser() {
        apiService.post(qaUser);

    }

    @Then("the user should see {string} message")
    public void theUserShouldSeeMessage(String message) {
        Assert.assertEquals(
                apiService.getFromMessageToStatus(message),
                apiService.getResponse().getStatusCode());
    }

    @When("the user gets the same user")
    public void theUserGetsSameUser() {
        apiService.get(apiService.getLastId());
    }

    @And("the user should see field {string} with value {string}")
    public void theUserShouldSeeFieldWithValue(String field, String value) {
        Assert.assertEquals(value, apiService.getField(field));
    }

    @When("the user puts the same user")
    public void theUserPutsTheSameUser() {
        apiService.put(apiService.getLastId(), qaUser);
    }


    @When("the user deletes the same user")
    public void theUserDeletesTheSameUser() {
        apiService.delete(apiService.getLastId());
    }

    @Then("the user should see your schema")
    public void theUserShouldSeeYourSchema() {
        Assert.assertThat(apiService.getResponse().getBody().prettyPrint(),
                apiService.matchSchema());
    }

    @And("the user fills all fields")
    public void theUserFillsAllFields() {
        HashMap data = apiService.getDataFile();

        new QaUser();
        qaUser = QaUser.builder().
                login(data.get("login").toString()).
                full_name(data.get("full_name").toString()).
                email(data.get("email").toString()).
                age(Integer.valueOf(data.get("age").toString())).build();
    }
}
