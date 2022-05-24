package services;


import io.restassured.http.ContentType;
import pojo.QaUser;
import pojo.Users;

import static io.restassured.RestAssured.given;

public class APIService extends TestingSupport{

    public APIService(){
        setURI("http://agapito-server.herokuapp.com/users");
        setSchemaFile("schemas/users/qa-users-schema.json");
        setDataFile("APIUser","usuarios");
    }


    public void fillFields(QaUser qaUser, String field, String value) {
        switch (field){
            case "login" : qaUser.setLogin(value);break;
            case "full_name" : qaUser.setFull_name(value);break;
            case "email" : qaUser.setEmail(value);break;
            case "age" : qaUser.setAge(Integer.valueOf(value));break;
        }
    }

    public String getField(String field) {
        String res = "";
        Users usersAux = getGson().fromJson(getResponse().jsonPath().prettify(), Users.class);

        switch (field){
            case "login": res = usersAux.getLogin();break;
            case "full_name": res = usersAux.getFull_name();break;
            case "email": res = usersAux.getEmail();break;
            case "age": res = usersAux.getAge().toString();break;
        }
        return res;
    }


    public void post(QaUser qaUser) {
        String bodySended = getGson().toJson(qaUser);
        logRequest(bodySended);

        setResponse(
                given().when()
                .contentType(ContentType.JSON)
                .accept(ContentType.JSON)
                .body(bodySended)
                .post(getURI())
                .then().extract().response()
        );
        logResponse();
        QaUser userAux = getGson().fromJson(getResponse().jsonPath().prettify(), QaUser.class);
        setLastId(userAux.getId());
    }

    public void get(Integer id) {
        setResponse(given().
                when().
                contentType(ContentType.JSON).
                accept(ContentType.JSON).
                get(getURI()+ "/" + id.toString()).
                then().extract().response()
        );
        logResponse();
    }

    public void put(Integer id, QaUser user) {
        String bodySended = getGson().toJson(user);
        setResponse(given().
                when().
                contentType(ContentType.JSON).
                accept(ContentType.JSON).
                body(bodySended).
                put(getURI()+ "/" + id.toString()).
                then().extract().response()
        );
        logResponse();
    }

    public void delete(Integer id ) {
        setResponse(given().
                when().
                contentType(ContentType.JSON).
                accept(ContentType.JSON).
                delete(getURI()+ "/" + id.toString()).
                then().extract().response()
        );
        logResponse();
    }
}
