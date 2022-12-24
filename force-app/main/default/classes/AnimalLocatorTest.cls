@isTest
public class AnimalLocatorTest {

    @isTest static  void testGetCallout() {
        
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // Call method to test
        String result = AnimalLocator.getAnimalNameById(0);
        // Verify mock response is not null
        System.assertNotEquals(null,result, 'The callout returned a null response.');
       
    }   
}